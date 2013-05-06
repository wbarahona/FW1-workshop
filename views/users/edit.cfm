<cfoutput>
<div class="hero">
<h1>#rc.title#</h1>
</div>
<div class="row-fluid">
<form class="form-horizontal" action="#buildURL('users.updateUser')#" method="post">
<input type="hidden" name="id" value="#rc.qryUser.id#">
<div class="control-group">
<label class="control-label" for="inputEmail">User Name</label>
<div class="controls">
<input type="text" name="userName" id="inputUserName" class="input-xlarge" value="#rc.qryUser.username#" >
</div>
</div>
<div class="control-group">
<label class="control-label" for="inputPassword">Password</label>
<div class="controls">
<input type="password" name="password" class="input-xlarge" id="inputPassword" value="#rc.qryUser.password#" >
</div>
</div>
<div class="control-group">
<div class="controls">
<button type="submit" class="btn">Edit User</button>
</div>
</div>
</form>
</div>
</cfoutput>