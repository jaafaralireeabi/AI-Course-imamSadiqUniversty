function xoUI

    H = 200;   %height
    
    fig = figure('Name', 'Character recognition', 'NumberTitle', 'off', ...
                 'MenuBar', 'none', 'ToolBar', 'none', 'Resize', 'off', ...
                 'Position', [300 300 459 H]);
    %5x5
    boxes = gobjects(1, 25);
    k = 0;
    for r = 0:4
        for c = 0:4
            k = k + 1;
            boxes(k) = uicontrol(fig, 'Style', 'checkbox', ...
                'Position', [30 + 30*c, H - (10 + 30*r) - 20, 16, 20]);
        end
    end

    % --- text and fields   ---
    hStatus = uicontrol(fig, 'Style', 'text', 'String', 'Welcome to the program.', ...
        'Position', [200, H - 10 - 16, 221, 16], 'HorizontalAlignment', 'center');

    hEdit = uicontrol(fig, 'Style', 'edit', 'String', '', ...
        'Position', [200, H - 40 - 28, 93, 28], 'HorizontalAlignment', 'center');

    hOut = uicontrol(fig, 'Style', 'text', 'String', 'OUTPUT', ...
        'Position', [330, H - 40 - 28, 93, 28], 'FontSize', 11, ...
        'FontWeight', 'bold', 'HorizontalAlignment', 'center');

    % ---  buttons and menu ---
    uicontrol(fig, 'Style', 'pushbutton', 'String', 'SET', ...
        'Position', [200, H - 80 - 28, 93, 28], 'Callback', @onSet);

    uicontrol(fig, 'Style', 'pushbutton', 'String', 'PREDICTION', ...
        'Position', [330, H - 80 - 28, 93, 28], 'Callback', @onPredict);

    uicontrol(fig, 'Style', 'pushbutton', 'String', 'CLEAR', ...
        'Position', [200, H - 120 - 28, 93, 28], 'Callback', @onClear);

    hAlg = uicontrol(fig, 'Style', 'popupmenu', ...
        'String', {'Hebb'}, ...
        'Position', [330, H - 120 - 28, 93, 28]);
    
    
%  ----------- button functions ------------
    function x = getPattern()
        x = -ones(1, 25);
        for i = 1:25
            if get(boxes(i), 'Value') == 1
                x(i) = 1;
            end
        end
    end

    function onSet(~, ~)
        x = getPattern();               
        letter = lower(strtrim(get(hEdit, 'String')));
            if strcmp(letter, 'x')
                t = 1;
            elseif strcmp(letter, 'o')
                t = -1;
            else
                set(hStatus, 'String', 'Your data is not valid!!!');
            return;
          end
        row = [getPattern(), t];
        fid = fopen('xoData.txt', 'a');
        fprintf(fid, '%d ', row(1:end-1));
        fprintf(fid, '%d\n', row(end));
        fclose(fid);
        
        set(hStatus, 'String', 'Your data saved.');
    end

  function onPredict(~, ~)
    x = getPattern()
    
    switch get(hAlg, 'Value')
        case 1
            set(hOut, 'String', charReco(x));
        otherwise
            set(hOut, 'String', '?');
    end
  end

    function onClear(~, ~)
        for i = 1:25
            set(boxes(i), 'Value', 0);
        end
        set(hEdit,   'String', '');
        set(hOut,    'String', 'OUTPUT');
        set(hStatus, 'String', 'Welcome to the program.');
    end
end