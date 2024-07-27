def plot_decision_boundary(model, X, y,title="Decision Boundary"):
    x_min, x_max = X[:, 0].min() - 1, X[:, 0].max() + 1
    y_min, y_max = X[:, 1].min() - 1, X[:, 1].max() + 1
    xx, yy = np.meshgrid(np.arange(x_min, x_max, 0.01),
                         np.arange(y_min, y_max, 0.01))
    Z = model.forward(np.c_[xx.ravel(), yy.ravel()])
    Z = Z.reshape(xx.shape)
    plt.contourf(xx, yy, Z, alpha=0.8)
    plt.scatter(X[:, 0], X[:, 1], c=y.ravel(), edgecolors='k', marker='o')
    plt.xlabel('Feature 1')
    plt.ylabel('Feature 2')
    plt.title(title)
    plt.show()

class neuronlayer:
    def __init__(self,ins,outs,lr=0.1) -> None:
        self.ins = ins
        self.out = outs
        self.weights = np.random.uniform(size=(ins,outs))
        self.bias = np.random.uniform(size=(1,outs))
        self.prev = None
        self.next = None
        self.lr = lr
    
    def __repr__(self) -> str:
        return f"neuronlayer({self.ins},{self.out})"
    
    def sigmoid(self,x):
        return 1/(1+np.exp(-x))
    
    def sigmoid_derv(self,x):
        return x*(1-x)
    
    def forward(self,x):
        self.a_1 = x
        self.wb = np.dot(x,self.weights)
        self.n = self.wb + self.bias
        self.a = self.sigmoid(self.n)
        return self.a
    
    def backprop(self,output=None):
        if self.next==None:
            s = -2*self.sigmoid_derv(self.a)*(output-self.a)
            self.s = s
        else:
            s = np.dot(self.next.s,self.next.weights.T)*self.sigmoid_derv(self.a)
            self.s = s
        
        self.weights -= self.lr*np.dot(self.a_1.T,s)
        self.bias -= self.lr*np.sum(s,axis=0,keepdims=True)
        if self.prev!=None:
            self.prev.backprop()


class neuralnetwork:
    def __init__(self,layers,input,output) -> None:
        self.layers = []
        prev=None

        for i in range(1,len(layers)):
            l1 = neuronlayer(layers[i-1],layers[i])
            l1.prev = prev
            self.layers.append(l1)
            prev = l1
        
        for i in range(0,len(self.layers)-1):
            self.layers[i].next = self.layers[i+1]

        self.input = input
        self.output = output
    
    def __repr__(self) -> str:
        return f"neuralnetwork({self.layers})"
    
    def forward(self,x=None):
        if x is None:
            x = self.input
        for i in self.layers:
            x = i.forward(x)
        return x
    
    def backprop(self):
        x = self.forward()
        self.layers[-1].backprop(output = self.output)
    
    def fit(self,epochs,print_loss=True):
        for i in range(epochs):
            self.backprop()
            if print_loss:
                if i%100==0:
                    print(f"Loss after {i} epochs: {np.sum((self.output-self.forward())**2)}")
        
        print(f"Loss after {epochs} epochs: {np.sum((self.output-self.forward())**2)}")
    
    def getweights(self):
        w = []
        b =[]
        for i in self.layers:
            w.append(i.weights)
            b.append(i.bias)
        
        return w,b


x = np.array([[0,0],[0,1],[1,0],[1,1]])
y = np.array([[0],[1],[1],[0]])

model = neuralnetwork([2,5,1],x,y)

model.fit(10000,print_loss=False)


# Plot the decision boundary
plot_decision_boundary(model, x, y)
print(model.forward())