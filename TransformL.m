function Y = TransformL(y, nclass, type)

n =length(y);
if nargin <= 2
    type = '01';
end;

if nargin > 1
    c = nclass;
    class_set = 1:c;
else
    class_set = unique(y);
    c = length(class_set);
end;

if strcmp(type, '01')
    Y = zeros(n, c);
    for cn = 1:c
        Y((y==class_set(cn)),cn) = 1;
    end;
else
    Y = -1*ones(n, c);
    for cn = 1:c
        Y((y==class_set(cn)),cn) = 1;
    end;
end;
