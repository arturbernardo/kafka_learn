## Kafka dir:
/opt/kafka/bin/

## docker para rodar o kcat de qualquer lugar sem "sujar" a maquina.
Com isso consigo ver os metadados e informacoes do cluster a partir do handshake com o bootstrap.
```docker run --rm edenhill/kcat -b <IP>:9092 -L```

## instalar, caso desejado. Pode ser localhost no lugar do IP, se quiser testar de dentro da maquina onde o kafka está.
```sudo dnf install -y librdkafka-tools```
```kcat -b <IP>:9092 -L```

## Exemplo metadados handshake. Broker 1 tem o IP
Metadata for all topics (from broker -1: <PUBLICO>:9092/bootstrap):
 1 brokers:
  broker 1 at <IP-advertised.listeners>:9092 (controller)
 3 topics:
  topic "first_topic" with 1 partitions:
    partition 0, leader 1, replicas: 1, isrs: 1
  topic "transactions" with 3 partitions:
    partition 0, leader 1, replicas: 1, isrs: 1
    partition 1, leader 1, replicas: 1, isrs: 1
    partition 2, leader 1, replicas: 1, isrs: 1
  topic "__consumer_offsets" with 50 partitions:
    partition 0, leader 1, replicas: 1, isrs: 1
