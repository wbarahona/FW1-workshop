<cfcomponent name="userService">

	<cffunction name="validateLogin" access="public" returntype="query">
		<cfargument name="username" require="true" type="string" />
		<cfargument name="password" require="true" type="string" />

		<cfquery name="qryCheckUser" datasource="#application.settings.global.dsn#">

			SELECT *
			FROM users
			WHERE username = '#ARGUMENTS.username#'
			AND password = '#ARGUMENTS.password#'
			
		</cfquery>
		
		<cfreturn qryCheckUser />
	</cffunction>

	<cffunction name="getUsers" access="public" returntype="query">
		<cfargument name="id" type="numeric" required="false" default=0>

		<cfset qryUsers = queryNew("")/>

		<cftry>
			<cfquery name="qryUsers" datasource="#application.settings.global.dsn#">
				SELECT * FROM users
				WHERE 0=0
				<cfif ARGUMENTS.id GT 0>
					AND id = #ARGUMENTS.id#
				</cfif>
			</cfquery>
			<cfcatch type="any">

			</cfcatch>
		</cftry>
		<cfreturn qryUsers/>
	</cffunction>

	<cffunction name="save" access="public" returntype="struct">
		<cfargument name="username" require="true" type="string" />
		<cfargument name="password" require="true" type="string" />

		<cfset structResult = structNew() />
		<cfset structResult.code = 1 />
		<cfset structResult.message = "" />

		<cftry>
			<cfquery name="qrySaveUser" datasource="#application.settings.global.dsn#">
				INSERT INTO users(username, password)
				VALUES('#ARGUMENTS.username#','#ARGUMENTS.password#')
			</cfquery>
		<cfcatch type="any">
			<cfset structResult.code = 0/>
			<cfset structResult.message = cfcatch.message />
		</cfcatch>
		</cftry>
		<cfreturn structResult/>
	</cffunction>
	
	<cffunction name="update" access="public" returntype="struct">
		<cfargument name="id" required="true" type="numeric">
		<cfargument name="username" require="true" type="string" />
		<cfargument name="password" require="true" type="string" />

		<cfset structResult = structNew() />
		<cfset structResult.code = 1 />
		<cfset structResult.message = "" />

		<cftry>
			<cfquery name="qrySaveUser" datasource="#application.settings.global.dsn#">
				UPDATE users
				SET username='#ARGUMENTS.username#', password='#ARGUMENTS.password#'
				WHERE id = #ARGUMENTS.id#
			</cfquery>
		<cfcatch type="any">
			<cfdump var="#cfcatch#">
			<cfset structResult.code = 0/>
			<cfset structResult.message = cfcatch.message />
		</cfcatch>
		</cftry>
		<cfreturn structResult/>
	</cffunction>

	<cffunction name="delete" access="public" returntype="struct">
		<cfargument name="id" required="true" type="numeric">

		<cfset structResult = structNew() />
		<cfset structResult.code = 1 />
		<cfset structResult.message = "" />

		<cftry>
			<cfquery name="qryDeleteUser" datasource="#application.settings.global.dsn#">
				DELETE FROM users
				WHERE id = #ARGUMENTS.id#
			</cfquery>
		<cfcatch type="any">
			<cfdump var="#cfcatch#">
			<cfset structResult.code = 0/>
			<cfset structResult.message = cfcatch.message />
		</cfcatch>
		</cftry>
		<cfreturn structResult/>
	</cffunction>
</cfcomponent>