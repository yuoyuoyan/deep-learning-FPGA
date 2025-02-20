% load trained weight and bias
load('FCNN_database.mat');

% test it
activations = cnnConvolve(filterDim, numFilters, testImages, Wc, bc);%sigmoid(wx+b)
activationsPooled = cnnPool(poolDim, activations);
activationsPooled = reshape(activationsPooled,[],length(testLabels));
h = exp(bsxfun(@plus,Wd * activationsPooled,bd));
probs = bsxfun(@rdivide,h,sum(h,1));
[~,preds] = max(probs,[],1);
preds = preds';
acc = sum(preds==testLabels)/length(preds);
fprintf('Accuracy is %f\n',acc);