i=0
while [ "$i" -le 1000 ]; do
    curl -w "%{http_code}" -X POST 'https://reddog.purpledune-e6465e68.eastus2.azurecontainerapps.io/order' -H 'Content-Type: application/json' -d '{"storeId": "Redmond","customerName": "John 'Hannibal' Smith","loyaltyId": "42","orderItems": [{"menuItemId": 1,"quantity": 1},{"menuItemId": 2,"quantity": 1},{"menuItemId": 3,"quantity": 3}]}'
    i=$(( i + 1 ))
done 


curl http://localhost:3500/v1.0/invoke/make-line-service/method/orders/Redmond

curl http://localhost:3500/v1.0/state/reddog.state.makeline/Redmond
