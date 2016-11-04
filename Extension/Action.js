var Action = function(){};
Action.prototype = {
    run:function(parameter){
        parameters.completionFunction({"URL": document.URL, "title": document.title });
    },
    
    finalize:function(parameter){
        
    }
};

var ExtensionPreprocessingJS = new Action;