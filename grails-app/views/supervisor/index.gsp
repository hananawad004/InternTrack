<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Supervisors - InternTrack</title>
    <style>
    .page-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
    }
    .page-title h1 {
        color: #2C3E50;
        font-weight: 700;
        margin: 0;
    }
    .page-title p {
        color: #7F8C8D;
        margin: 5px 0 0;
    }
    .btn-create {
        background: linear-gradient(135deg, #1ABC9C, #16A085);
        color: white;
        padding: 12px 24px;
        border-radius: 8px;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 8px;
        font-weight: 600;
        transition: all 0.3s;
    }
    .btn-create:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(26, 188, 156, 0.3);
        color: white;
    }
    .table-container {
        background: white;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        padding: 20px;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
    }
    .table th {
        background: #F8F9FA;
        color: #2C3E50;
        font-weight: 600;
        padding: 15px;
        text-align: left;
        border-bottom: 2px solid #ECF0F1;
    }
    .table td {
        padding: 15px;
        border-bottom: 1px solid #ECF0F1;
        color: #34495E;
    }
    .table tr:hover {
        background: #F8F9FA;
    }
    .avatar-sm {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
    }
    .btn-view {
        padding: 6px 12px;
        background: #3498DB;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        font-size: 13px;
        transition: all 0.3s;
        display: inline-block;
    }
    .btn-view:hover {
        background: #2980B9;
        color: white;
    }
    .btn-edit {
        padding: 6px 12px;
        background: #F39C12;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        font-size: 13px;
        transition: all 0.3s;
        display: inline-block;
    }
    .btn-edit:hover {
        background: #E67E22;
        color: white;
    }
    .empty-state {
        text-align: center;
        padding: 60px 20px;
        color: #7F8C8D;
    }
    .empty-state i {
        font-size: 48px;
        margin-bottom: 20px;
        color: #BDC3C7;
    }
    </style>
</head>

<div class="page-header">
    <div class="page-title">
        <h1><i class="fas fa-user-tie"></i> Supervisors</h1>
        <p>${supervisorCount} total supervisors</p>
    </div>

    <g:link controller="supervisor" action="create" class="btn-create">
        <i class="fas fa-plus-circle"></i> Add New Supervisor
    </g:link>
</div>

<g:if test="${flash.message}">
    <div class="alert alert-success" style="margin-bottom: 20px;">
        <i class="fas fa-check-circle"></i> ${flash.message}
    </div>
</g:if>

<div class="table-container">
    <g:if test="${supervisors}">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Employee ID</th>
                <th>Department</th>
                <th>Position</th>
                <th>Interns</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${supervisors}" var="supervisor">
                <tr>
                    <td>${supervisor.id}</td>
                    <td>
                        <div style="display: flex; align-items: center; gap: 10px;">
                            <div class="avatar-sm">
                                ${supervisor.user?.initials ?: 'SU'}
                            </div>
                            ${supervisor.user?.fullName}
                        </div>
                    </td>
                    <td>${supervisor.employeeId}</td>
                    <td>${supervisor.department}</td>
                    <td>${supervisor.position}</td>
                    <td>${supervisor.currentInternCount}/${supervisor.maxInterns}</td>
                    <td>
                        <g:link controller="supervisor" action="show" id="${supervisor.id}" class="btn-view">
                            <i class="fas fa-eye"></i> View
                        </g:link>
                        <g:link controller="supervisor" action="edit" id="${supervisor.id}" class="btn-edit">
                            <i class="fas fa-edit"></i> Edit
                        </g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:if>
    <g:else>
        <div class="empty-state">
            <i class="fas fa-user-tie"></i>
            <h3>No Supervisors Found</h3>
            <p>Get started by adding your first supervisor.</p>
            <g:link controller="supervisor" action="create" class="btn-create" style="display: inline-flex; margin-top: 20px;">
                <i class="fas fa-plus-circle"></i> Add New Supervisor
            </g:link>
        </div>
    </g:else>
</div>

</html>