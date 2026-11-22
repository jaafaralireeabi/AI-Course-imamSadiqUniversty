function xoData = importfile1(filename, dataLines)
    %% Input handling
    %If dataLines is not specified, define defaults
    if nargin < 2 
        dataLines = [1, Inf]; 
    end

    %% Set up the Import Options and import the data
    opts = delimitedTextImportOptions('NumVariables', 26);
    % Specify range and delimiter
    opts.DataLines = dataLines;
    opts.Delimiter = ' ';
    % ... column names and types (VarName1 ... VarName26, "double")
    % Specify file level properties
    opts.ExtraColumnsRule = 'ignore';
    opts.EmptyLineRule = 'read';
    opts.ConsecutiveDelimitersRule = 'join';
    opts.LeadingDelimitersRule = 'ignore';

    %% Import the data
    xoData = readtable(filename, opts);

    %% Convert to output type
    xoData = table2array(xoData);
end

