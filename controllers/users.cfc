<cfcomponent>
	<cffunction name="init">
		<cfargument name="fw" type="any" />
		<cfset variables.fw = fw />
		<Cfreturn this />
	</cffunction>

	<cffunction name="default" output="false">
		<cfset rc.title  = "Users Management" />
		<cfset variables.fw.service("userService.getUsers", "qryUsers") />
	</cffunction>

	<cffunction name="add" output="false">
		<cfset rc.title  = "Users Management - Add a user" />
		<cfset variables.fw.service("userService.getUsers", "qryUsers") />
	</cffunction>

		<cffunction name="startSave" output="false">
			<cfparam name="rc.username" default=""/>
			<cfparam name="rc.password" default=""/>

			<cfset rc.msg = ""/>
			<cfset rc.msgType = "error"/>

			<cfif not len(trim(rc.username))>
				<cfset rc.msg = rc.msg&"User Name is required. <br/>">
			</cfif>
			<cfif not len(trim(rc.password))>
				<cfset rc.msg = rc.msg&"User Password is required. <br/>">
			</cfif>

			<cfif len(rc.msg)>
				<cfset variables.fw.redirect("users.add","username,password,msg,msgType")>
			<cfelse>
				<cfset variables.fw.service("userService.save","result") />
			</cfif>
		</cffunction>

		<cffunction name="endSave" output="false">

			<cfif rc.result.code GT 0>
				<cfset rc.msg = "User added successfully"/>
				<cfset rc.msgType = "success"/>
				<cfset variables.fw.redirect("users.default","msg,msgType") />
			<cfelse>
				<cfset rc.msg = rc.result.message />
				<cfset variables.fw.redirect("users.add","username,password,msg,msgType")/>
			</cfif>
		</cffunction>


	<cffunction name="edit" output="false">
		<cfset rc.title  = "Users Management - Edit a user" />
		<cfparam name="rc.id" default=0/>
		<cfset variables.fw.service("userService.getUsers", "qryUser") />
	</cffunction>

		<cffunction name="startUpdateUser" output="false">
			<cfparam name="rc.username" default=""/>
			<cfparam name="rc.password" default=""/>

			<cfset rc.msg = ""/>
			<cfset rc.msgType = "error"/>

			<cfif not len(trim(rc.username))>
				<cfset rc.msg = rc.msg&"User Name is required. <br/>">
			</cfif>
			<cfif not len(trim(rc.password))>
				<cfset rc.msg = rc.msg&"User Password is required. <br/>">
			</cfif>

			<cfif len(rc.msg)>
				<cfset variables.fw.redirect("users.add","username,password,msg,msgType")>
			<cfelse>
				<cfset variables.fw.service("userService.update","result") />
			</cfif>
		</cffunction>

		<cffunction name="endUpdateUser" output="false">

			<cfif rc.result.code GT 0>
				<cfset rc.msg = "User updated successfully"/>
				<cfset rc.msgType = "success"/>
				<cfset variables.fw.redirect("users.default","msg,msgType") />
			<cfelse>
				<cfset rc.msg = rc.result.message />
				<cfset variables.fw.redirect("users.update","username,password,msg,msgType")/>
			</cfif>
		</cffunction>

		<cffunction name="startDelete" output="false">
			<cfparam name="rc.id" default=""/>
			<cfset rc.msg = "" />
			<cfset rc.msgType = "error"/>
			<!---<cfdump var="#rc#" abort="true">--->
			<cfif not len(rc.id)>
				<cfdump var="#rc.id#" abort="true">
				<cfset rc.msg = "No username defined"/>
			</cfif>

			<cfif len(rc.msg)>
				<cfset variables.fw.redirect("users.default","username,password,msg,msgType")>
			<cfelse>
				<cfset variables.fw.service("userService.delete","result") />
			</cfif>
		</cffunction>

		<cffunction name="endDelete" output="false">

			<cfif rc.result.code GT 0>
				<cfset rc.msg = "User deleted successfully"/>
				<cfset rc.msgType = "success"/>
				<cfset variables.fw.redirect("users.default","msg,msgType") />
			<cfelse>
				<cfset rc.msg = rc.result.message />
				<cfset variables.fw.redirect("users.default","username,password,msg,msgType")/>
			</cfif>
		</cffunction>
</cfcomponent>