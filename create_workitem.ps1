$pat = ''

$AzureDevOpsAuthenticationHeader = @{Authorization = 'Basic' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($pat)"))}

$uri = 'https://dev.azure.com/prasathchandrasekaran0421/TestProj/_apis/wit/workitems/$Task?api-version=7.0'

$body = 
@"
[
    {
        "op": "add",
        "path": "/fields/System.Title",
        "from": null,
        "value": "Sample task"
    },
    {
        "op": "add",
        "path": "/fields/System.AssignedTo",
        "value": "prasath.chandrasekaran@outlook.com"
    },
]
"@

Invoke-RestMethod -Method POST -Uri $uri -ContentType 'application/json-patch+json' -Headers $AzureDevOpsAuthenticationHeader -Body $body