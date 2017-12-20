% Super-fast Attitude of Accelerometer and Magnetometer 
% Jin Wu, Zebo Zhou and Hassen Fourati.
%
% author: Jin Wu
% e-mail: jin_wu_uestc@hotmail.com; klinsmann.zhou@gmail.com


function q = SAAM(Ab, Mb)

    ax = Ab(1);       ay = Ab(2);       az = Ab(3);
    mx = Mb(1);       my = Mb(2);       mz = Mb(3);

    mD = dot(Ab, Mb);
    mN = sqrt(1 - mD^2);

    s = 1 / (-(ay*(mN + mx)) + ax*my);
    q = [((-1 + az)*(mN + mx) + ax*(mD - mz)) * s;
         ((-1 + az)*my + ay*(mD - mz)) * s;
         (az*mD - ax*mN - mz) * s;
         1];
    
    q = q ./ norm(q);
end