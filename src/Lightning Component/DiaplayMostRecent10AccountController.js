({
	initme : function(component, event, helper) {
        var col = [
            {label:'Account Name', fieldName:'Name', type:'Text'},
            {label:'Account Phone', fieldName:'Phone', type:'Text'},
            {label:'Account Rating', fieldName:'Rating', type:'Text'}
        ];
        component.set("v.col", col);
        
        var action = component.get("c.GetAccData");
        action.setCallback(this,function(response){
            component.set("v.data", response.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})
