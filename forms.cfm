		
<cffunction name="$formHelper" returntype="VOID" access="public" output="false">
	<cfargument name="args" type="struct">
	
	<cfscript>
		var loc = {};
		if( structKeyExists( arguments.args, "helper" ) AND len( arguments.args.helper ) ) {
			loc.helperArgs = {};
			// any args prefixed "helper" are passed in by name to the helper function (and removed as not to upset other forms methods)
			// the rest of the arguments are passed in as "args" so they are passed by value and can be modified
			for( loc.item in arguments.args ) {
				if( left( loc.item, 6 ) IS "helper" ) {
					if( loc.item IS "helper" ) {
						loc.helper = evaluate( "#arguments.args.helper#Helper" );
					} else {
						loc.helperArgs[ replace( loc.item, "helper", "" ) ] = arguments.args[ loc.item ];
					}
					structDelete( arguments.args, loc.item );
				}
			}
			loc.helper( args=arguments.args, argumentCollection=loc.helperArgs );
		}
	</cfscript>
</cffunction>


<cffunction name="$formGetErrors" returntype="array" access="public" output="false">
	<cfargument name="objectName" type="any" required="true">
	<cfargument name="property" type="string" required="true">
	<cfscript>
		var loc = {};
		loc.returnValue = [];
		if (!IsStruct(arguments.objectName))
		{
			loc.object = $getObject(arguments.objectName);
			if (application.wheels.showErrorInformation && !IsObject(loc.object))
				$throw(type="Wheels.IncorrectArguments", message="The `#arguments.objectName#` variable is not an object.");
			loc.returnValue = loc.object.errorsOn(arguments.property);
		}
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>


<cffunction name="$formBeforeElement" returntype="string" access="public" output="false">
	<cfargument name="objectName" type="any" required="true">
	<cfargument name="property" type="string" required="true">
	<cfargument name="label" type="any" required="true">
	<cfargument name="labelPlacement" type="string" required="true">
	<cfargument name="prepend" type="string" required="true">
	<cfargument name="append" type="string" required="true">
	<cfargument name="prependToLabel" type="string" required="true">
	<cfargument name="appendToLabel" type="string" required="true">
	<cfargument name="errorElement" type="string" required="true">
	<cfargument name="errorClass" type="string" required="true">
	<cfargument name="errors" type="array" required="true">
	<cfscript>
		var loc = {};
		loc.returnValue = "";
		if (Len(arguments.errorElement) AND arrayLen( arguments.errors ))
			loc.returnValue = loc.returnValue & $tag(name=arguments.errorElement, class=arguments.errorClass);
		arguments.label = $getFieldLabel(argumentCollection=arguments);
		if (Len(arguments.label) && arguments.labelPlacement != "after")
		{
			loc.returnValue = loc.returnValue & $createLabel(argumentCollection=arguments);
			if (arguments.labelPlacement == "around")
				loc.returnValue = Replace(loc.returnValue, "</label>", "");
			else
				loc.returnValue = loc.returnValue & arguments.appendToLabel;
		}
		loc.returnValue = loc.returnValue & arguments.prepend;
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>


<cffunction name="$formAfterElement" returntype="string" access="public" output="false">
	<cfargument name="objectName" type="any" required="true">
	<cfargument name="property" type="string" required="true">
	<cfargument name="label" type="string" required="true">
	<cfargument name="labelPlacement" type="string" required="true">
	<cfargument name="prepend" type="string" required="true">
	<cfargument name="append" type="string" required="true">
	<cfargument name="prependToLabel" type="string" required="true">
	<cfargument name="appendToLabel" type="string" required="true">
	<cfargument name="errorElement" type="string" required="true">
	<cfargument name="errors" type="array" required="true">
	<cfscript>
		var loc = {};
		loc.returnValue = arguments.append;
		arguments.label = $getFieldLabel(argumentCollection=arguments);
		if (Len(arguments.label) && arguments.labelPlacement != "before")
		{
			if (arguments.labelPlacement == "after")
				loc.returnValue = loc.returnValue & $createLabel(argumentCollection=arguments);
			else if (arguments.labelPlacement == "around")
				loc.returnValue = loc.returnValue & "</label>";
			loc.returnValue = loc.returnValue & arguments.appendToLabel;
		}
		if (Len(arguments.errorElement) AND arrayLen(arguments.errors))
			loc.returnValue = loc.returnValue & "</" & arguments.errorElement & ">";
	</cfscript>
	<cfreturn loc.returnValue>
</cffunction>