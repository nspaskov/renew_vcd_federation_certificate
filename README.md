# renew_vcd_federation_certificate

### Renewing or Regenerating Your Federation Certificate
vCloud Director by design creates a Federation Certificate for every Organisation vDC that is created.

The certificate is valid for one year, after which it expires unless it is renewed or regenerated (as VMware terms it).

Prior to this expiry, you will receive a notification email to your admin email with the date that the certificate is due to expire.

To avoid such noise in your monitoring system and your email, use the ps1 script to regenerate your org federation certificates across your vCD instances.
