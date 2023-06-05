// import com.mithin.DSA_ASSIGNMENT


#include <stdio.h>
#include <malloc.h>

struct DeQueueCustom {
  int front;
  int rear;
  int count;
  int *data;

  int size;
};

const int DEFAULT_SIZE = 10;

void Constructor (struct DeQueueCustom* queue, int size) {
  queue->data = (int*)malloc(size * sizeof(int));
  queue->front = -1;
  queue->rear = -1;
  queue->count = 0;
  queue->size = size;
}

void initializeWithDefaultSize(struct DeQueueCustom* queue) {
    Constructor(queue, DEFAULT_SIZE);
}

int isEmpty(struct DeQueueCustom* queue) {
    return queue->count == 0;
}

int isFull(struct DeQueueCustom* queue) {
    return queue->count == queue->size;
}

void Insert_from_theRearEnd(struct DeQueueCustom* queue, int item) {
    if (isFull(queue)) {
        printf("Queue is full!!\n");
        return;
    }

    if (isEmpty(queue)) {
        queue->front = 0;
    }

    queue->rear = (queue->rear + 1) % queue->size;
    queue->count++;
    queue->data[queue->rear] = item;
}

void delete_From_theFrontEnd(struct DeQueueCustom* queue) {
    if (isEmpty(queue)) {
        printf("Queue is Empty!!\n");
        return;
    }
    if (queue->front == queue->rear) {
        queue->front = -1;
        queue->rear = -1;
    } else {
        queue->front = (queue->front + 1) % queue->size;
    }
    queue->count--;
}

void Insert_from_theFrontEnd(struct DeQueueCustom* queue, int item) {
    if (isFull(queue)) {
        printf("Queue is full!!\n");
        return;
    }

    if (queue->front == 0) {
        queue->front = queue->size - 1;
    } else {
        queue->front = queue->front - 1;
    }
    queue->data[queue->front] = item;
    queue->count++;
}

void delete_From_theRearEnd(struct DeQueueCustom* queue) {
    if (isEmpty(queue)) {
        printf("Queue is Empty!!\n");
        return;
    }

    if (queue->rear == 0) {
        queue->rear = queue->size - 1;
    } else {
        queue->rear = queue->rear - 1;
    }
    queue->count--;
}

void peek_frontEnd(struct DeQueueCustom* queue) {
    if (isEmpty(queue)) {
        printf("Queue is Empty!!\n");
        return;
    }

    printf("%d\n", queue->data[queue->front]);
}

void peek_rearEnd(struct DeQueueCustom* queue) {
    if (isEmpty(queue)) {
        printf("Queue is Empty!!\n");
        return;
    }

    printf("%d\n", queue->data[queue->rear]);
}

void display(struct DeQueueCustom* queue) {
    if (isEmpty(queue)) {
        printf("Queue is Empty!!\n");
        return;
    }

    int i = queue->front;
    
    do {
        printf("%d | ", queue->data[i]);
        i = (i + 1) % queue->size;
    } while (i != (queue->rear + 1) % queue->size);
}

void main() {
  struct DeQueueCustom queue;

  Constructor(&queue, 5);

  Insert_from_theRearEnd(&queue, 1);
  // queue.Insert_from_theRearEnd(2);
  // queue.Insert_from_theRearEnd(3);
  // queue.Insert_from_theRearEnd(4);
  // queue.Insert_from_theRearEnd(5);

  Insert_from_theFrontEnd(&queue, 10);
  Insert_from_theFrontEnd(&queue, 11);

  // queue.delete_From_theRearEnd();
  // queue.delete_From_theFrontEnd();

  peek_frontEnd(&queue);
  peek_rearEnd(&queue);

  display(&queue);
}