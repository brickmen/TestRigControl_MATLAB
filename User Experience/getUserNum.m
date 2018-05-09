% Asks user for a number

fprintf(' Value Set: %d \n', ux_num)
ux_prompt = ' Use default? <y> to accept, <s> to cancel, or type a number: ';
ux_user_input = input(ux_prompt, 's');
switch ux_user_input
    case ''
        fprintf(' Accepting Default\n')
        
    case 'y'
        fprintf(' Accepting Default\n')
        
    case 's'
        fprintf(' Cancelling Input\n')
        return;
    otherwise
        fprintf(' New Input Accepted:  %s \n', ux_user_input )
        
end
ux_num = str2double(ux_user_input);
        
