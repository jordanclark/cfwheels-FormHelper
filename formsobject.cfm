<cffunction name="textField" returntype="string" access="public" output="false">
	<cfargument name="objectName" type="any" required="true" hint="The variable name of the object to build the form control for.">
	<cfargument name="property" type="string" required="true" hint="The name of the property to use in the form control.">
	<cfargument name="association" type="string" required="false" hint="The name of the association that the property is located on. Used for building nested forms that work with nested properties. If you are building a form with deep nesting, simply pass in a list to the nested object, and Wheels will figure it out.">
	<cfargument name="position" type="string" required="false" hint="The position used when referencing a `hasMany` relationship in the `association` argument. Used for building nested forms that work with nested properties. If you are building a form with deep nestings, simply pass in a list of positions, and Wheels will figure it out.">
	<cfargument name="label" type="string" required="false" hint="The label text to use in the form control.">
	<cfargument name="labelPlacement" type="string" required="false" hint="Whether to place the label `before`, `after`, or wrapped `around` the form control.">
	<cfargument name="prepend" type="string" required="false" hint="String to prepend to the form control. Useful to wrap the form control with HTML tags.">
	<cfargument name="append" type="string" required="false" hint="String to append to the form control. Useful to wrap the form control with HTML tags.">
	<cfargument name="prependToLabel" type="string" required="false" hint="String to prepend to the form control's `label`. Useful to wrap the form control with HTML tags.">
	<cfargument name="appendToLabel" type="string" required="false" hint="String to append to the form control's `label`. Useful to wrap the form control with HTML tags.">
	<cfargument name="errorElement" type="string" required="false" hint="HTML tag to wrap the form control with when the object contains errors.">
	<cfargument name="errorClass" type="string" required="false" hint="The class name of the HTML tag that wraps the form control when there are errors.">
	<cfargument name="helper" type="string" required="false" hint="Name of the function to run to prepare input style.">
	<cfscript>
		var loc = {};
		$args(name="textField", reserved="type,name,value", args=arguments);
		arguments.objectName = $objectName(argumentCollection=arguments);
		arguments.errors = $formGetErrors(argumentCollection=arguments);
		if (!StructKeyExists(arguments, "id"))
			arguments.id = $tagId(arguments.objectName, arguments.property);
		if( len( arguments.helper ) ) {
			$formHelper(args=arguments);
		}
		loc.before = $formBeforeElement(argumentCollection=arguments);
		loc.after = $formAfterElement(argumentCollection=arguments);
		arguments.type = "text";
		arguments.name = $tagName(arguments.objectName, arguments.property);
		loc.maxlength = $maxLength(argumentCollection=arguments);
		if (StructKeyExists(loc, "maxlength"))
			arguments.maxlength = loc.maxlength;
		arguments.value = $formValue(argumentCollection=arguments);
		loc.returnValue = loc.before & $tag(name="input", close=true, skip="errors,objectName,property,label,labelPlacement,prepend,append,prependToLabel,appendToLabel,errorElement,errorClass,association,position", skipStartingWith="label", attributes=arguments) & loc.after;
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>


<cffunction name="passwordField" returntype="string" access="public" output="false">
	<cfargument name="objectName" type="any" required="true" hint="See documentation for @textField.">
	<cfargument name="property" type="string" required="true" hint="See documentation for @textField.">
	<cfargument name="association" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="position" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="label" type="string" required="false" hint="See documentation for @textField">
	<cfargument name="labelPlacement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prepend" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="append" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prependToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="appendToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorElement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorClass" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="helper" type="string" required="false" hint="Name of the function to run to prepare input style.">
	<cfscript>
		var loc = {};
		$args(name="passwordField", reserved="type,name,value", args=arguments);
		arguments.objectName = $objectName(argumentCollection=arguments);
		arguments.errors = $formGetErrors(argumentCollection=arguments);
		if (!StructKeyExists(arguments, "id"))
			arguments.id = $tagId(arguments.objectName, arguments.property);
		if( len( arguments.helper ) ) {
			$formHelper(args=arguments);
		}
		loc.before = $formBeforeElement(argumentCollection=arguments);
		loc.after = $formAfterElement(argumentCollection=arguments);
		arguments.type = "password";
		arguments.name = $tagName(arguments.objectName, arguments.property);
		loc.maxlength = $maxLength(argumentCollection=arguments);
		if (StructKeyExists(loc, "maxlength"))
			arguments.maxlength = loc.maxlength;
		arguments.value = $formValue(argumentCollection=arguments);
		loc.returnValue = loc.before & $tag(name="input", close=true, skip="errors,objectName,property,label,labelPlacement,prepend,append,prependToLabel,appendToLabel,errorElement,errorClass,association,position", skipStartingWith="label", attributes=arguments) & loc.after;
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>

<cffunction name="fileField" returntype="string" access="public" output="false">
	<cfargument name="objectName" type="any" required="true" hint="See documentation for @textField.">
	<cfargument name="property" type="string" required="true" hint="See documentation for @textField.">
	<cfargument name="association" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="position" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="label" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="labelPlacement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prepend" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="append" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prependToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="appendToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorElement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorClass" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="helper" type="string" required="false" hint="Name of the function to run to prepare input style.">
	<cfscript>
		var loc = {};
		$args(name="fileField", reserved="type,name", args=arguments);
		arguments.objectName = $objectName(argumentCollection=arguments);
		arguments.errors = $formGetErrors(argumentCollection=arguments);
		if (!StructKeyExists(arguments, "id"))
			arguments.id = $tagId(arguments.objectName, arguments.property);
		if( len( arguments.helper ) ) {
			$formHelper(args=arguments);
		}
		loc.before = $formBeforeElement(argumentCollection=arguments);
		loc.after = $formAfterElement(argumentCollection=arguments);
		arguments.type = "file";
		arguments.name = $tagName(arguments.objectName, arguments.property);
		loc.returnValue = loc.before & $tag(name="input", close=true, skip="errors,objectName,property,label,labelPlacement,prepend,append,prependToLabel,appendToLabel,errorElement,errorClass,association,position", skipStartingWith="label", attributes=arguments) & loc.after;
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>

<cffunction name="textArea" returntype="string" access="public" output="false">
	<cfargument name="objectName" type="any" required="true" hint="See documentation for @textField.">
	<cfargument name="property" type="string" required="true" hint="See documentation for @textField.">
	<cfargument name="association" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="position" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="label" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="labelPlacement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prepend" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="append" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prependToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="appendToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorElement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorClass" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="helper" type="string" required="false" hint="Name of the function to run to prepare input style.">
	<cfscript>
		var loc = {};
		$args(name="textArea", reserved="name", args=arguments);
		arguments.objectName = $objectName(argumentCollection=arguments);
		arguments.errors = $formGetErrors(argumentCollection=arguments);
		if (!StructKeyExists(arguments, "id"))
			arguments.id = $tagId(arguments.objectName, arguments.property);
		if( len( arguments.helper ) ) {
			$formHelper(args=arguments);
		}
		loc.before = $formBeforeElement(argumentCollection=arguments);
		loc.after = $formAfterElement(argumentCollection=arguments);
		arguments.name = $tagName(arguments.objectName, arguments.property);
		loc.content = $formValue(argumentCollection=arguments);
		loc.returnValue = loc.before & $element(name="textarea", skip="errors,objectName,property,label,labelPlacement,prepend,append,prependToLabel,appendToLabel,errorElement,errorClass,association,position", skipStartingWith="label", content=loc.content, attributes=arguments) & loc.after;
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>

<cffunction name="radioButton" returntype="string" access="public" output="false">
	<cfargument name="objectName" type="any" required="true" hint="See documentation for @textField.">
	<cfargument name="property" type="string" required="true" hint="See documentation for @textField.">
	<cfargument name="association" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="position" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="tagValue" type="string" required="true" hint="The value of the radio button when `selected`.">
	<cfargument name="label" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="labelPlacement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prepend" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="append" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prependToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="appendToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorElement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorClass" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="helper" type="string" required="false" hint="Name of the function to run to prepare input style.">
	<cfscript>
		var loc = {};
		$args(name="radioButton", reserved="type,name,value,checked", args=arguments);
		arguments.objectName = $objectName(argumentCollection=arguments);
		arguments.errors = $formGetErrors(argumentCollection=arguments);
		loc.valueToAppend = LCase(Replace(ReReplaceNoCase(arguments.tagValue, "[^a-z0-9- ]", "", "all"), " ", "-", "all"));
		if( len( arguments.helper ) ) {
			$formHelper(args=arguments);
		}
		if (!StructKeyExists(arguments, "id"))
		{
			arguments.id = $tagId(arguments.objectName, arguments.property);
			if (len(loc.valueToAppend))
				arguments.id = arguments.id & "-" & loc.valueToAppend;
		}
		loc.before = $formBeforeElement(argumentCollection=arguments);
		loc.after = $formAfterElement(argumentCollection=arguments);
		arguments.type = "radio";
		arguments.name = $tagName(arguments.objectName, arguments.property);
		arguments.value = arguments.tagValue;
		if (arguments.tagValue == $formValue(argumentCollection=arguments))
			arguments.checked = "checked";
		loc.returnValue = loc.before & $tag(name="input", close=true, skip="errors,objectName,property,tagValue,label,labelPlacement,prepend,append,prependToLabel,appendToLabel,errorElement,errorClass,association,position", skipStartingWith="label", attributes=arguments) & loc.after;
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>

<cffunction name="checkBox" returntype="string" access="public" output="false">
	<cfargument name="objectName" type="any" required="true" hint="See documentation for @textField.">
	<cfargument name="property" type="string" required="true" hint="See documentation for @textField.">
	<cfargument name="association" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="position" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="checkedValue" type="string" required="false" hint="The value of the check box when it's in the `checked` state.">
	<cfargument name="uncheckedValue" type="string" required="false" hint="The value of the check box when it's in the `unchecked` state.">
	<cfargument name="label" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="labelPlacement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prepend" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="append" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prependToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="appendToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorElement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorClass" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="helper" type="string" required="false" hint="Name of the function to run to prepare input style.">
	<cfscript>
		var loc = {};
		$args(name="checkBox", reserved="type,name,value,checked", args=arguments);
		arguments.objectName = $objectName(argumentCollection=arguments);
		arguments.errors = $formGetErrors(argumentCollection=arguments);
		if (!StructKeyExists(arguments, "id"))
			arguments.id = $tagId(arguments.objectName, arguments.property);
		if( len( arguments.helper ) ) {
			$formHelper(args=arguments);
		}
		loc.before = $formBeforeElement(argumentCollection=arguments);
		loc.after = $formAfterElement(argumentCollection=arguments);
		arguments.type = "checkbox";
		arguments.name = $tagName(arguments.objectName, arguments.property);
		arguments.value = arguments.checkedValue;
		loc.value = $formValue(argumentCollection=arguments);
		if (loc.value == arguments.value || IsNumeric(loc.value) && loc.value == 1 || !IsNumeric(loc.value) && IsBoolean(loc.value) && loc.value)
			arguments.checked = "checked";
		loc.returnValue = loc.before & $tag(name="input", close=true, skip="errors,objectName,property,checkedValue,uncheckedValue,label,labelPlacement,prepend,append,prependToLabel,appendToLabel,errorElement,errorClass,association,position", skipStartingWith="label", attributes=arguments);
		if (Len(arguments.uncheckedValue))
		{
			loc.hiddenAttributes = {};
			loc.hiddenAttributes.type = "hidden";
			loc.hiddenAttributes.id = arguments.id & "-checkbox";
			loc.hiddenAttributes.name = arguments.name & "($checkbox)";
			loc.hiddenAttributes.value = arguments.uncheckedValue;
			loc.returnValue = loc.returnValue & $tag(name="input", close=true, attributes=loc.hiddenAttributes);
		}
		loc.returnValue = loc.returnValue & loc.after;
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>

<cffunction name="select" returntype="string" access="public" output="false">
	<cfargument name="objectName" type="any" required="true" hint="See documentation for @textField.">
	<cfargument name="property" type="string" required="true" hint="See documentation for @textField.">
	<cfargument name="association" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="position" type="string" required="false" hint="See documentation for @textfield.">
	<cfargument name="options" type="any" required="true" hint="A collection to populate the select form control with. Can be a query recordset or an array of objects.">
	<cfargument name="includeBlank" type="any" required="false" hint="Whether to include a blank option in the select form control. Pass `true` to include a blank line or a string that should represent what display text should appear for the empty value (for example, ""- Select One -"").">
	<cfargument name="valueField" type="string" required="false" hint="The column or property to use for the value of each list element. Used only when a query or array of objects has been supplied in the `options` argument.">
	<cfargument name="textField" type="string" required="false" hint="The column or property to use for the value of each list element that the end user will see. Used only when a query or array of objects has been supplied in the `options` argument.">
	<cfargument name="label" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="labelPlacement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prepend" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="append" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="prependToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="appendToLabel" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorElement" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="errorClass" type="string" required="false" hint="See documentation for @textField.">
	<cfargument name="helper" type="string" required="false" hint="Name of the function to run to prepare input style.">
	<cfscript>
		var loc = {};
		$args(name="select", reserved="name", args=arguments);
		arguments.objectName = $objectName(argumentCollection=arguments);
		arguments.errors = $formGetErrors(argumentCollection=arguments);
		if (!StructKeyExists(arguments, "id"))
			arguments.id = $tagId(arguments.objectName, arguments.property);
		if( len( arguments.helper ) ) {
			$formHelper(args=arguments);
		}
		loc.before = $formBeforeElement(argumentCollection=arguments);
		loc.after = $formAfterElement(argumentCollection=arguments);
		arguments.name = $tagName(arguments.objectName, arguments.property);
		if (StructKeyExists(arguments, "multiple") and IsBoolean(arguments.multiple))
		{
			if (arguments.multiple)
				arguments.multiple = "multiple";
			else
				StructDelete(arguments, "multiple");
		}
		loc.content = $optionsForSelect(argumentCollection=arguments);
		if (!IsBoolean(arguments.includeBlank) || arguments.includeBlank)
		{
			if (!IsBoolean(arguments.includeBlank))
				loc.blankOptionText = arguments.includeBlank;
			else
				loc.blankOptionText = "";
			loc.blankOptionAttributes = {value=""};
			loc.content = $element(name="option", content=loc.blankOptionText, attributes=loc.blankOptionAttributes) & loc.content;
		}
		loc.returnValue = loc.before & $element(name="select", skip="errors,objectName,property,options,includeBlank,valueField,textField,label,labelPlacement,prepend,append,prependToLabel,appendToLabel,errorElement,errorClass,association,position", skipStartingWith="label", content=loc.content, attributes=arguments) & loc.after;
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>
