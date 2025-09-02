#!/bin/bash
# Script untuk setup search attributes yang diperlukan PeerDB

echo "Setting up Temporal search attributes for PeerDB..."

# Tunggu Temporal server siap
echo "Waiting for Temporal server to be ready..."
sleep 10

# Tambahkan search attribute MirrorName jika belum ada
echo "Adding MirrorName search attribute..."
echo Y | docker exec -i temporal-admin-tools tctl admin cluster add-search-attributes --name MirrorName --type Text

echo "Search attributes setup completed!"

# Tampilkan search attributes yang tersedia
echo "Current search attributes:"
docker exec temporal-admin-tools tctl admin cluster get-search-attributes
