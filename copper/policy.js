$$.forEach(function($){
  if ($.kind === 'Service') {
    console.log("---")
    console.log("Service: " + $.metadata.name)
    if (! findDeploymentForService($$, $.spec.selector)) {
        errors.add_error('selector',"selector" , 1)
    }
  } else if ($.kind === 'Deployment') {
    var regex = new RegExp("we");
    console.log(regex.test($.metadata.name))
  }
});
