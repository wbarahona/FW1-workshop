<cfdump var="#rc.qryUsers#"/>
<cfoutput>
	<div class="hero">
		<h1>#rc.title#</h1>
		<p>This is the the User Management page</p>
		<a href="#buildURL('users.add')#" class="btn btn-primary"><i class="icon-user icon-white"></i> Add User</a>
	</div>
	<div class="row-fluid">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Username</th>
					<th>Password</th>
					<th>Actions</th>
				</tr>
			</thead>
			<cfloop query="#rc.qryUsers#">
				<tr>
					<td>#id#</td>
					<td>#userName#</td>
					<td>#Password#</td>
					<td>
						<a href="#buildURL('users.edit&id=#id#')#" class="btn"> <i class="icon-pencil"></i></a> | <a href="##myModal#id#" role="button" class="btn" data-toggle="modal"><i class="icon-remove"></i></a>
						<div id="myModal#id#" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
								<h4 id="myModalLabel#id#">Confirm Action</h4>
							</div>
							<div class="modal-body">
								<p>Are you sure you want to delete this user?</p>
							</div>
							<div class="modal-footer">
								<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
								<a href="#buildURL('users.delete&id=#id#')#" class="btn btn-primary">Yes</a>
							</div>
						</div>
					</td>
				</tr>
			</cfloop>
		</table>
	</div>
</cfoutput>