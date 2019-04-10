function [adjacent]=updategraph(G,i)
load('adjdata.mat')
if i==2
    node1=0; node2=0;
    adjacent1=adj(1:6,1:6);
    G1=graph(adjacent1);
    c1=centrality(G1,'eigenvector');
    c2=centrality(G1,'closeness');
    c=(c1+c2)./2;
    for i=1:6     
        if c(i)==max(c)            
            node1=i;                   
        end
    end
    adjacent2=adj(7:19,7:19);
    G2=graph(adjacent2);
    c1=centrality(G2,'eigenvector');
    c2=centrality(G2,'closeness');
    c=(c1+c2)./2;
    for i=1:13     
        if c(i)==max(c)            
            node2=i+6;                   
        end
    end  
    G=addedge(G,node1,node2,1);
    adjacent=adjacency(G);
    end
    
if i==3
    node1=0; node2=0;
    adjacent1=adj(1:19,1:19);
    G1=graph(adjacent1);
    c1=centrality(G1,'eigenvector');
    c2=centrality(G1,'closeness');
    c=(c1+c2)./2;
    for i=1:19     
        if c(i)==max(c)            
            node1=i;                   
        end
    end
    adjacent2=adj(20:27,20:27);
    G2=graph(adjacent2);
    c1=centrality(G2,'eigenvector');
    c2=centrality(G2,'closeness');
    c=(c1+c2)./2;
    for i=1:8     
        if c(i)==max(c)            
            node2=i+19;                   
        end
    end  
     G=addedge(G,node1,node2,1);
    adjacent=adjacency(G);
end    

if i==4
    node1=0; node2=0;
    adjacent1=adj(1:27,1:27);
    G1=graph(adjacent1);
    c1=centrality(G1,'eigenvector');
    c2=centrality(G1,'closeness');
    c=(c1+c2)./2;
    for i=1:27     
        if c(i)==max(c)            
            node1=i;                   
        end
    end
    adjacent2=adj(28:34,28:34);
    G2=graph(adjacent2);
    c1=centrality(G2,'eigenvector');
    c2=centrality(G2,'closeness');
    c=(c1+c2)./2;
    for i=1:7     
        if c(i)==max(c)            
            node2=i+27;                   
        end
    end  
     G=addedge(G,node1,node2,1);
    adjacent=adjacency(G);
end   
    if i==5
    node1=0; node2=0;
    adjacent1=adj(1:34,1:34);
    G1=graph(adjacent1);
    c1=centrality(G1,'eigenvector');
    c2=centrality(G1,'closeness');
    c=(c1+c2)./2;
    for i=1:34     
        if c(i)==max(c)            
            node1=i;                   
        end
    end
    adjacent2=adj(35:39,35:39);
    G2=graph(adjacent2);
    c1=centrality(G2,'eigenvector');
    c2=centrality(G2,'closeness');
    c=(c1+c2)./2;
    for i=1:5     
        if c(i)==max(c)            
            node2=i+34;                   
        end
    end  
     G=addedge(G,node1,node2,1);
    adjacent=adjacency(G);
    end
    
end  

