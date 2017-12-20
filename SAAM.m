% Super-fast Attitude of Accelerometer and Magnetometer 
% Jin Wu, Zebo Zhou and Hassen Fourati.
%
% author: Jin Wu
% e-mail: jin_wu_uestc@hotmail.com; klinsmann.zhou@gmail.com


function q = SAAM(Ab, Mb)

    ax = Ab(1);       ay = Ab(2);       az = Ab(3);
    mx = Mb(1);       my = Mb(2);       mz = Mb(3);

    mD = ax * mx + ay * my + az * mz;
    mN = sqrt(1 - mD * mD);

    q = [- ay * (mN + mx) + ax * my;
         (az - 1) * (mN + mx) + ax * (mD - mz);
         (az - 1) * my + ay * (mD - mz);
         az * mD - ax * mN - mz];
    
    q = q ./ norm(q);
end