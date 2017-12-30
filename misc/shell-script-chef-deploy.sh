knife exec -E <<EOF "
nodes.transform(
  :chef_environment => 'Dev-Deploy'  
) { |node| 
    node.set['application_version_node_file'] = '0.0.1-${bamboo.buildNumber}';
    node.save;
}"
EOF
