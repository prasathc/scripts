$pat = ''

$AzureDevOpsAuthenticationHeader = @{Authorization = 'Basic' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($pat)"))}

$uri = 'https://dev.azure.com/prasathchandrasekaran0421/TestProj/_apis/wit/workitems/6?api-version=7.0'

$body = 
@"
[
  {
    "op": "add",
    "path": "/fields/System.State",
    "value": "Done"
  }    
]
"@

Invoke-RestMethod -Method PATCH -Uri $uri -ContentType 'application/json-patch+json' -Headers $AzureDevOpsAuthenticationHeader -Body $body