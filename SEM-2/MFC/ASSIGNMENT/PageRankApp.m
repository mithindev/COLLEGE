classdef PageRankApp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure         matlab.ui.Figure
        GraphAxes        matlab.ui.control.UIAxes
        AddButton        matlab.ui.control.Button
        NodeValueField   matlab.ui.control.NumericEditField
        FromNodeField    matlab.ui.control.NumericEditField
        ToNodeField      matlab.ui.control.NumericEditField
        CalculateButton  matlab.ui.control.Button
        PageRankText     matlab.ui.control.TextArea
    end

    % App initialization and construction
    methods (Access = private)
        function createGraph(app)
            % Initialize the adjacency matrix
            A = zeros(10);
            
            % Get the nodes and connections
            nodes = app.NodeValueField.Value;
            connections = [app.FromNodeField.Value, app.ToNodeField.Value];
            
            % Set the connections in the adjacency matrix
            for i = 1:size(connections, 1)
                fromNode = connections(i, 1);
                toNode = connections(i, 2);
                A(fromNode, toNode) = 1;
            end
            
            % Compute the transition matrix
            n = size(A, 1);
            M = A ./ repmat(sum(A, 2), 1, n);
            
            % Set the damping factor
            dampingFactor = 0.85;
            
            % Initialize the PageRank vector
            PR = ones(n, 1) / n;
            
            % Iterate until convergence
            maxIterations = 100;
            for iter = 1:maxIterations
                oldPR = PR;
                PR = dampingFactor * M * PR + (1 - dampingFactor) / n * ones(n, 1);
                if norm(PR - oldPR) < 1e-6
                    break;
                end
            end
            
            % Plot the graph
            G = digraph(A);
            plot(app.GraphAxes, G, 'Layout', 'force', 'NodeLabel', nodes, 'MarkerSize', 7, 'NodeColor', 'r');
            
            % Display the PageRank scores
            app.PageRankText.Value = num2str(PR);
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = PageRankApp

            % Create UIFigure and components
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'Page Rank App';

            app.GraphAxes = uiaxes(app.UIFigure);
            app.GraphAxes.Position = [31 178 378 285];

            app.AddButton = uibutton(app.UIFigure, 'push');
            app.AddButton.Position = [432 344 100 22];
            app.AddButton.Text = 'Add Node';

            app.NodeValueField = uieditfield(app.UIFigure, 'numeric');
            app.NodeValueField.Position = [432 316 100 22];

            app.FromNodeField = uieditfield(app.UIFigure, 'numeric');
            app.FromNodeField.Position = [545 316 33 22];

            app.ToNodeField = uieditfield(app.UIFigure, 'numeric');
            app.ToNodeField.Position = [590 316 33 22];

            app.CalculateButton = uibutton(app.UIFigure, 'push');
            app.CalculateButton.Position = [432 244 100 22];
            app.CalculateButton.Text = 'Calculate PageRank';

            app.PageRankText = uitextarea(app.UIFigure);
            app.PageRankText.Position = [432 108 210 122];
            app.PageRankText.Value = '';

            % Button pushed function: AddButton
            app.AddButton.ButtonPushedFcn = createCallbackFcn(app, @createGraph, true);

            % Button pushed function: CalculateButton
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @createGraph, true);

            % Show the UIFigure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = PageRankApp

            % Create UIFigure and components
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'Page Rank App';

            app.GraphAxes = uiaxes(app.UIFigure);
            app.GraphAxes.Position = [31 178 378 285];

            app.AddButton = uibutton(app.UIFigure, 'push');
            app.AddButton.Position = [432 344 100 22];
            app.AddButton.Text = 'Add Node';

            app.NodeValueField = uieditfield(app.UIFigure, 'numeric');
            app.NodeValueField.Position = [432 316 100 22];

            app.FromNodeField = uieditfield(app.UIFigure, 'numeric');
            app.FromNodeField.Position = [545 316 33 22];

            app.ToNodeField = uieditfield(app.UIFigure, 'numeric');
            app.ToNodeField.Position = [590 316 33 22];

            app.CalculateButton = uibutton(app.UIFigure, 'push');
            app.CalculateButton.Position = [432 244 100 22];
            app.CalculateButton.Text = 'Calculate PageRank';

            app.PageRankText = uitextarea(app.UIFigure);
            app.PageRankText.Position = [432 108 210 122];
            app.PageRankText.Value = '';

            % Button pushed function: AddButton
            app.AddButton.ButtonPushedFcn = createCallbackFcn(app, @createGraph, true);

            % Button pushed function: CalculateButton
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @createGraph, true);

            % Show the UIFigure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end
end
