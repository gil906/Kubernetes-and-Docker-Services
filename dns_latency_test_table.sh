# To Test DNS Latency in order to select the best DNS servers for Adguard or Pihole:

#!/bin/bash

# List of DNS servers
dns_servers=(
    "tls://one.one.one.one"
    "tls://dns.google"
    "tls://dns.quad9.net"
    "9.9.9.9"
    "8.8.8.8"
    "1.1.1.1"
    "94.140.14.14"
    "94.140.15.15"
    "208.76.152.1"
    "208.76.152.9"
)

# List of sample queries
queries=(
    "google.com"
    "bing.com"
    "linkedin.com"
    "x.com"
    "facebook.com"
    "twitter.com"
    "github.com"
    "stackoverflow.com"
)

# Number of tests to perform for each query
num_tests=5

# Function to test DNS resolution latency
test_latency() {
    local server=$1
    local query=$2
    local latencies=()
    local start_time
    local end_time
    local latency

    for ((i=0; i<num_tests; i++)); do
        if [[ $server == tls://* ]]; then
            # DNS over TLS
            start_time=$(date +%s%3N)
            kdig +tls @${server#tls://} $query > /dev/null 2>&1
            end_time=$(date +%s%3N)
        else
            # Regular DNS
            start_time=$(date +%s%3N)
            dig @$server $query > /dev/null 2>&1
            end_time=$(date +%s%3N)
        fi

        latency=$((end_time - start_time))
        latencies+=($latency)
    done

    # Calculate min, max, and average latency
    min_latency=$(printf "%s\n" "${latencies[@]}" | sort -n | head -n1)
    max_latency=$(printf "%s\n" "${latencies[@]}" | sort -n | tail -n1)
    avg_latency=$(printf "%s\n" "${latencies[@]}" | awk '{sum+=$1} END {print sum/NR}')

    echo -e "$query\tmin=${min_latency}ms\tmax=${max_latency}ms\tavg=${avg_latency}ms"
    echo $avg_latency
}

# Main script
declare -A server_avg_latencies
declare -A server_min_latencies
declare -A server_max_latencies

for server in "${dns_servers[@]}"; do
    echo -e "\nUsing $server:"
    total_avg_latency=0
    total_min_latency=0
    total_max_latency=0
    for query in "${queries[@]}"; do
        result=$(test_latency $server $query)
        avg_latency=$(echo "$result" | tail -n1)
        total_avg_latency=$(echo "$total_avg_latency + $avg_latency" | bc)
    done
    overall_avg_latency=$(echo "$total_avg_latency / ${#queries[@]}" | bc)
    server_avg_latencies[$server]=$overall_avg_latency
done

# Sort and display recommended DNS servers
echo -e "\nRecommended DNS servers:"
for server in "${!server_avg_latencies[@]}"; do
    echo "$server ${server_avg_latencies[$server]}"
done | sort -k2 -n | awk '{print NR " - " $1 " avg=" $2 "ms"}'
