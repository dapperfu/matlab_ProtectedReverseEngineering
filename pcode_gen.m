
script_dir = fileparts(mfilename('fullpath'));
pcode_src = fullfile(script_dir, 'pcode_src');
addpath(pcode_src);

scripts = dir(fullfile(pcode_src, '*.m'));

for script = scripts'
    assert(strcmp(script.folder, pcode_src));
    [~, fcn_name] = fileparts(script.name);
    pcode(fcn_name);
    break
end

%
rmpath(pcode_src);

% Make sure path was removed.
for script = scripts'
    fcns_found = which(fcn_name, '-all');
    assert(len(fcns_found)==1)
end
