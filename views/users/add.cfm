<cfparam name="rc.username" default="" />
<cfparam name="rc.password" default="" />
<cfoutput>
	<div class="hero">
		<h1>#rc.title#</h1>
	</div>
	<div class="row-fluid">
		<form class="form-horizontal" action="#buildURL('users.save')#" method="post">
			<div class="control-group">
				<label class="control-label" for="inputEmail">User Name</label>
				<div class="controls">
					<input type="text" name="userName" id="inputUserName" class="input-xlarge" <cfif len(rc.username)> value="#rc.username#" <cfelse> placeholder="User Name" </cfif> >
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">Password</label>
				<div class="controls">
					<input type="password" name="password" class="input-xlarge" id="inputPassword" <cfif len(rc.password)> value="#rc.password#" <cfelse> placeholder="Password" </cfif> >
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn">Create User</button>
				</div>
			</div>
		</form>
	</div>
</cfoutput>