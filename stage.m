F=[];

%change f = @(x)ex1(x) to f = @(x)ex2(x) in SMED.m for running the other distribution function;
load('positiondata.mat')
    K = transpose(B);
load('adjdata.mat');
G=graph(adj);
    
for i = 1:5      
    if i==1        
        V=[K(1:6,1),K(1:6,2)]
        F=[F;V];
        [p,q]=size(F);  
    end
    if i==2
        V=[K(7:19,1),K(7:19,2)]       
        F=[F;V];
        [p,q]=size(F); 
        adj=updategraph(G,i);
    end
    if i==3
       V=[K(20:27,1),K(20:27,2)]
       F=[F;V];
        [p,q]=size(F);
        G=graph(adj);
        adj=updategraph(G,i);
    end
    if i==4       
        V=[K(28:34,1),K(28:34,2)]
        F=[F;V];
        [p,q]=size(F);
        G=graph(adj);
        adj=updategraph(G,i);
    end
    if i==5
        V=[K(35:39,1),K(35:39,2)]
        F=[F;V];
        [p,q]=size(F);
        G=graph(adj);
        adj=updategraph(G,i);
    end
    
    I = reshape(F,1,p*2);
    [history,xsol,fsol] = pattern(p,I); 
    F = [reshape(xsol,p,2)];
    save(sprintf('PS_stage(%d)_random',i))
   end
    
adj1=adj;
G=graph(adj);
D=degree(G)

n1=2;
for i=3:6
    if D(i)==1
        G=addedge(G,n1,i,1);
        adj=adjacency(G);
        G=graph(adj);
        n1=i;
    end
 end
 node=0;
    adjacent1=adj(7:19,7:19);
    G1=graph(adjacent1);
    c1=centrality(G1,'eigenvector');
    c2=centrality(G1,'closeness');
    c=(c1+c2)./2;
    for i=1:13     
        if c(i)==max(c)            
            node=i+6;                   
        end
    end
G=addedge(G,n1,node,1);
adj=adjacency(G);
        G=graph(adj);
    n1=12;
for i=13:19
    if D(i)==1
        G=addedge(G,n1,i,1);
        adj=adjacency(G);
        G=graph(adj);
        n1=i;
    end
 end
 node=0;
    adjacent1=adj(20:27,20:27);
    G1=graph(adjacent1);
    c1=centrality(G1,'eigenvector');
    c2=centrality(G1,'closeness');
    c=(c1+c2)./2;
    for i=1:8    
        if c(i)==max(c)            
            node=i+19;                   
        end
    end
G=addedge(G,n1,node,1);

adj=adjacency(G);
        G=graph(adj);
     
        G=addedge(G,26,27,1);
        adj=adjacency(G);
        G=graph(adj);
              
 node=0;
    adjacent1=adj(28:34,28:34);
    G1=graph(adjacent1);
    c1=centrality(G1,'eigenvector');
    c2=centrality(G1,'closeness');
    c=(c1+c2)./2;
    for i=1:7    
        if c(i)==max(c)            
            node=i+27;                   
        end
    end
G=addedge(G,27,node,1);
adj=adjacency(G);
        G=graph(adj);
   
n1=31;
for i=32:34
    if D(i)==1
        G=addedge(G,n1,i,1);
        adj=adjacency(G);
        G=graph(adj);
        n1=i;
    end
 end
 node=0;
    adjacent1=adj(35:39,35:39);
    G1=graph(adjacent1);
    c1=centrality(G1,'eigenvector');
    c2=centrality(G1,'closeness');
    c=(c1+c2)./2;
    for i=1:5    
        if c(i)==max(c)            
            node=i+34;                   
        end
    end
G=addedge(G,n1,node,1);
adj=adjacency(G);
        G=graph(adj);

G=addedge(G,35,39,1);
adj=adjacency(G);
G=graph(adj);
e_original=abs(eig(adj1));
res_original=sum(e_original);
e_modified=abs(eig(adj));
res_modified=sum(e_modified);
Go=graph(adj1)
     
figure
plot(Go,'XData',F(1:39,1),'YData',F(1:39,2))
figure
plot(G,'XData',F(1:39,1),'YData',F(1:39,2))