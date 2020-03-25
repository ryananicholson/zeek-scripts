# Script to find DNS queries > 50 characters in length
# - Will often signify potential DNS tunneling

event dns_request(c: connection, msg: dns_msg, query: string, qtype: count, qclass: count) {
    if(query[50] != "") {
        print fmt("Potential DNS tunneling from host %s:", c$id$orig_h);
        print fmt("- %s", query);
    }
}
