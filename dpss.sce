function [dps_seq,lambda]=dpss(seq_length,time_halfbandwidth,num_seq)  
    T=seq_length;
    N=num_seq;
    W=time_halfbandwidth/T;
    H=zeros(T,T);
    for i=1:T
        for j=1:T
            if(i~=j)
                H(i,j)=(sin(2*3.1416*W*(i-j)))/(3.1416*(i-j));
            end
            if(i==j)
                H(i,j)=2*W;
            end
        end
    end
    b=[];
    [lambda,dps_seq]=eigs(H,b,N,"LA");
    for i=1:N
        if(dps_seq(1,i)<0)
            dps_seq(:,i)=-dps_seq(:,i);
        end
        
    end
endfunction



