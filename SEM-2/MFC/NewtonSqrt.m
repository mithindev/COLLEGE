% num = 45;
% 
% root = 0;
% x = num;
% 
% while (true)
%     root = x - (x*x - 40)/(2*x);
%     if (abs(root - x) < 0.1)
%         break;
%     end
%     x = root;
% end
% 
% 
% % while (true)
% %     root = 0.5 * (x + (num/x));
% % 
% %     if (abs(root - x) < 0.1)
% %         break;
% %     end
% %     x = root;
% % end
% 
% disp(root)

x = 3;
x0 = 1;

while (true)
    x = x0 - (x0*x0 - 3)/(2*x0);

    if (abs(x - x0) < 0.01)
        break;
    end

    x0 = x;
end

disp(x);