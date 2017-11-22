;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     calfdata.com. admin.calfdata.com. (
                              4         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
; name servers - NS records
    IN      NS      ns1.calfdata.com.
    IN      NS      ns2.calfdata.com.

; name servers - A records
ns1.calfdata.com.          IN      A       192.168.56.100
ns2.calfdata.com.          IN      A       192.168.56.101

; 10.128.0.0/16 - A records
vm1.calfdata.com.        IN      A      192.168.56.201
vm2.calfdata.com.        IN      A      192.168.56.202
www.calfdata.com.        IN      A      192.168.56.203

