# consul
consul



# test consul server

'''
docker run -it --rm --net=host nextlink/consul
'''


# run consul server in cluser mode

'''
docker run -it --net=host -e CLUSTER_SIZE=3 -e DC=mydc nextlink/consul

docker run -it --net=host -e CLUSTER_SIZE=3 -e JOIN=${IP} -e DC=mydc nextlink/consul
'''

# run consul agent


'''
docker run -it --net=host -e JOIN=${IP} -e DC=mydc nextlink/consul agent
'''
