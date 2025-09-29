StorageHost[] hosts = new StorageHost[5];

void initStorageHosts() {
  for (int i = 0; i < hosts.length; i++) {
    hosts[i] = new StorageHost("Host-" + i, 1.0);  // 1TB each
  }
}

void shareStorageOnPort(int port) {
  float share = 1.0 / hosts.length;  // 1TB divided across 5 hosts
  println("Sharing 1TB storage for port " + port);
  for (int i = 0; i < hosts.length; i++) {
    boolean success = hosts[i].allocate(share);
    println(hosts[i].name + ": " + (success ? "Allocated " + share + "TB" : "Insufficient space"));
  }
}
