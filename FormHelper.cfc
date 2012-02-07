<cfcomponent output="false" mixin="global">

<cffunction name="init">
	
	<cfset this.version = "1.1.5,1.1.7">
	
	<cfreturn this>
</cffunction>


<cffunction name="plainHelper">
	<cfargument name="args" type="struct">
	
	<cfscript>
		args.prependToLabel="";
		args.appendToLabel="";
		args.prepend="";
		args.append="";
	</cfscript>
	
	<cfreturn>
</cffunction>


<cffunction name="inlineErrorHelper">
	<cfargument name="args" type="struct">
	
	<cfscript>
		var loc = {};
		
		if( arrayLen( arguments.args.errors ) ) {
			loc.className &= " error";
		}
		for( loc.error in arguments.args.errors ) {
			arguments.args.append &= '<span>#loc.error.message#</span>';
		}
	</cfscript>
	
	<cfreturn>
</cffunction>


<cffunction name="bootstrapHelper">
	<cfargument name="args" type="struct">
	<cfargument name="inlineErrors" type="boolean" default="true">
	
	<cfscript>
		var loc = {
			className = "clearfix"
		};
		
		arguments.args.labelPlacement = "before";
		arguments.args.prepend = "";
		arguments.args.append = "";
		arguments.args.prependToLabel = "";
		arguments.args.appendToLabel = "";
		arguments.args.errorElement = "";
		arguments.args.errorClass = "";
		
		if( arrayLen( arguments.args.errors ) ) {
			loc.className &= " error";
		}
		arguments.args.appendToLabel &= '<div class="#loc.className#">';
		arguments.args.prepend &= '<div class="input">';
		
		if( arrayLen( arguments.args.errors ) ) {
			for( loc.error in arguments.args.errors ) {
				arguments.args.append &= '<span class="help-inline">#loc.error.message#</span>';
			}
		} else if( structKeyExists( arguments.args, "help" ) ) {
			arguments.args.append &= '<span class="help-inline">#arguments.args.help#</span>';
		}
		structDelete( arguments.args, "help" );
		
		arguments.args.append &= '</div></div>';
	</cfscript>
	
	<cfreturn>
</cffunction>


<cfinclude template="forms.cfm">
<cfinclude template="formsobject.cfm">


</cfcomponent>