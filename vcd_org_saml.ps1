$creds = Get-Credential
$vcd_instances = Get-Content ~/desktop/orgs_list
$info = @()
foreach ($vcd in $vcd_instances) {
    $server = Connect-CIServer -Server $vcd -NotDefault -Credential $creds
    $orgs = get-org -Server $server
    foreach ($org in $orgs) {
        $data = "" | Select-Object org, federation, CertificateExpiration
        $data.org = $org.name
        $data.federation = $org.ExtensionData.Settings.OrgFederationSettings.Enabled
        $data.CertificateExpiration = $org.ExtensionData.Settings.OrgFederationSettings.CertificateExpiration
        $info += $data
        $info
    }
    Disconnect-CIServer -Server $server -Confirm:$false
}
$info | Export-Csv -Path "~/desktop/saml.csv"
