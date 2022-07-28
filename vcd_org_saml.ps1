$creds = Get-Credential
$vcd_instances = Get-Content Desktop/vcds
foreach ($vcd in $vcd_instances) {
        $server = Connect-CIServer -Server $vcd -NotDefault -Credential $creds
    $orgs = get-org -Server $server
    foreach ($org in $orgs) {
    if ($Org.ExtensionData.Settings.OrgFederationSettings.Enabled -match "True") {
        $Org.ExtensionData.Settings.OrgFederationSettings.RegenerateFederationCertificate()
        Write-Host $org.name
    }
    }
    Disconnect-CIServer -Server $server -Confirm:$false
}
