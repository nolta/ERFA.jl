# ERFA.p06e
@testset "p06e" begin
    eps0, psia, oma, bpa, bqa, pia, bpia, epsa, chia, za, zetaa, thetaa, pa, gam, phi, psi = ERFA.p06e(2400000.5, 52541.0)
    @test isapprox(eps0, 0.4090926006005828715, atol = 1e-14)
    @test isapprox(psia, 0.6664369630191613431e-3, atol = 1e-14)
    @test isapprox(oma, 0.4090925973783255982, atol = 1e-14)
    @test isapprox(bpa, 0.5561149371265209445e-6, atol = 1e-14)
    @test isapprox(bqa, -0.6191517193290621270e-5, atol = 1e-14)
    @test isapprox(pia, 0.6216441751884382923e-5, atol = 1e-14)
    @test isapprox(bpia, 3.052014180023779882, atol = 1e-14)
    @test isapprox(epsa, 0.4090864054922431688, atol = 1e-14)
    @test isapprox(chia, 0.1387703379530915364e-5, atol = 1e-14)
    @test isapprox(za, 0.2921789846651790546e-3, atol = 1e-14)
    @test isapprox(zetaa, 0.3178773290332009310e-3, atol = 1e-14)
    @test isapprox(thetaa, 0.2650932701657497181e-3, atol = 1e-14)
    @test isapprox(pa, 0.6651637681381016344e-3, atol = 1e-14)
    @test isapprox(gam, 0.1398077115963754987e-5, atol = 1e-14)
    @test isapprox(phi, 0.4090864090837462602, atol = 1e-14)
    @test isapprox(psi, 0.6664464807480920325e-3, atol = 1e-14)
end

# ERFA.p2pv
@testset "p2pv" begin
    pv = ERFA.p2pv([0.25,1.2,3.0])
    @test isapprox(pv[1], 0.25, atol = 1e-12)
    @test isapprox(pv[2], 1.2, atol = 1e-12)
    @test isapprox(pv[3], 3.0, atol = 1e-12)
    @test isapprox(pv[4], 0.0, atol = 1e-12)
    @test isapprox(pv[5], 0.0, atol = 1e-12)
    @test isapprox(pv[6], 0.0, atol = 1e-12)
end

# ERFA.p2s
@testset "p2s" begin
    theta, phi, r = ERFA.p2s([100.,-50.,25.])
    @test isapprox(theta, -0.4636476090008061162, atol = 1e-12)
    @test isapprox(phi, 0.2199879773954594463, atol = 1e-12)
    @test isapprox(r, 114.5643923738960002, atol = 1e-12)
end

# ERFA.pap
@testset "pap" begin
    a = [1.,0.1,0.2]
    b = [-3.,1e-3,0.2]
    theta = ERFA.pap(a, b)
    @test isapprox(theta, 0.3671514267841113674, atol = 1e-12)
end

# ERFA.pas
@testset "pas" begin
    p = ERFA.pas(1.0, 0.1, 0.2, -1.0)
    @test isapprox(p, -2.724544922932270424, atol = 1e-12)
end

# ERFA.pb06
@testset "pb06" begin
    bzeta, bz, btheta = ERFA.pb06(2400000.5, 50123.9999)
    @test isapprox(bzeta, -0.5092634016326478238e-3, atol = 1e-12)
    @test isapprox(bz, -0.3602772060566044413e-3, atol = 1e-12)
    @test isapprox(btheta, -0.3779735537167811177e-3, atol = 1e-12)
end

# ERFA.pfw06
@testset "pfw06" begin
    gamb, phib, psib, epsa = ERFA.pfw06(2400000.5, 50123.9999)
    @test isapprox(gamb, -0.2243387670997995690e-5, atol = 1e-16)
    @test isapprox(phib, 0.4091014602391312808, atol = 1e-12)
    @test isapprox(psib, -0.9501954178013031895e-3, atol = 1e-14)
    @test isapprox(epsa, 0.4091014316587367491, atol = 1e-12)
end

# ERFA.pdp
@testset "pdp" begin
    ab = ERFA.pdp([2.,2.,3.], [1.,3.,4.])
    @test isapprox(ab, 20, atol = 1e-12)
end

# ERFA.plan94
@testset "plan94" begin
    @test_throws ERFAException ERFA.plan94(2400000.5, -320000., 10)
    p, v = ERFA.plan94(2400000.5, -320000., 3)
    @test isapprox(p[1], 0.9308038666832975759, atol = 1e-11)
    @test isapprox(p[2], 0.3258319040261346000, atol = 1e-11)
    @test isapprox(p[3], 0.1422794544481140560, atol = 1e-11)
    @test isapprox(v[1], -0.6429458958255170006e-2, atol = 1e-11)
    @test isapprox(v[2], 0.1468570657704237764e-1, atol = 1e-11)
    @test isapprox(v[3], 0.6406996426270981189e-2, atol = 1e-11)

    p, v = ERFA.plan94(2400000.5, 43999.9, 1)
    @test isapprox(p[1], 0.2945293959257430832, atol = 1e-11)
    @test isapprox(p[2], -0.2452204176601049596, atol = 1e-11)
    @test isapprox(p[3], -0.1615427700571978153, atol = 1e-11)
    @test isapprox(v[1], 0.1413867871404614441e-1, atol = 1e-11)
    @test isapprox(v[2], 0.1946548301104706582e-1, atol = 1e-11)
    @test isapprox(v[3], 0.8929809783898904786e-2, atol = 1e-11)
end

# ERFA.pm
@testset "pm" begin
    m = ERFA.pm([0.3,1.2,-2.5])
    @test isapprox(m, 2.789265136196270604, atol = 1e-14)
end

# ERFA.pmp
@testset "pmp" begin
    a = [2.0,2.0,3.0]
    b = [1.0,3.0,4.0]
    amb = ERFA.pmp(a, b)
    @test isapprox(amb[1], 1.0, atol = 1e-12)
    @test isapprox(amb[2], -1.0, atol = 1e-12)
    @test isapprox(amb[3], -1.0, atol = 1e-12)
end

# ERFA.pmpx
@testset "pmpx" begin
    rc = 1.234
    dc = 0.789
    pr = 1e-5
    pd = -2e-5
    px = 1e-2
    rv = 10.0
    pmt = 8.75
    pob = [0.9, 0.4, 0.1]
    pco = ERFA.pmpx(rc, dc, pr, pd, px, rv, pmt, pob)
    @test isapprox(pco[1], 0.2328137623960308440, atol = 1e-12)
    @test isapprox(pco[2], 0.6651097085397855317, atol = 1e-12)
    @test isapprox(pco[3], 0.7095257765896359847, atol = 1e-12)
end

# ERFA.pmsafe
@testset "pmsafe" begin
    ra1 = 1.234
    dec1 = 0.789
    pmr1 = 1e-5
    pmd1 = -2e-5
    px1 = 1e-2
    rv1 = 10.0
    ep1a = 2400000.5
    ep1b = 48348.5625
    ep2a = 2400000.5
    ep2b = 51544.5
    ra2, dec2, pmr2, pmd2, px2, rv2 = ERFA.pmsafe(ra1, dec1, pmr1, pmd1, px1, rv1, ep1a, ep1b, ep2a, ep2b)
    @test isapprox(ra2, 1.234087484501017061, atol = 1e-12)
    @test isapprox(dec2, 0.7888249982450468567, atol = 1e-12)
    @test isapprox(pmr2, 0.9996457663586073988e-5, atol = 1e-12)
    @test isapprox(pmd2, -0.2000040085106754565e-4, atol = 1e-16)
    @test isapprox(px2, 0.9999997295356830666e-2, atol = 1e-12)
    @test isapprox(rv2, 10.38468380293920069, atol = 1e-10)
end

# ERFA.pmat00
@testset "pmat00" begin
    rbp = ERFA.pmat00(2400000.5, 50123.9999)
    @test isapprox(rbp[1], 0.9999995505175087260, atol = 1e-12)
    @test isapprox(rbp[2], 0.8695405883617884705e-3, atol = 1e-14)
    @test isapprox(rbp[3], 0.3779734722239007105e-3, atol = 1e-14)
    @test isapprox(rbp[4], -0.8695405990410863719e-3, atol = 1e-14)
    @test isapprox(rbp[5], 0.9999996219494925900, atol = 1e-12)
    @test isapprox(rbp[6], -0.1360775820404982209e-6, atol = 1e-14)
    @test isapprox(rbp[7], -0.3779734476558184991e-3, atol = 1e-14)
    @test isapprox(rbp[8], -0.1925857585832024058e-6, atol = 1e-14)
    @test isapprox(rbp[9], 0.9999999285680153377, atol = 1e-12)
end

# ERFA.pmat06
@testset "pmat06" begin
    rbp = ERFA.pmat06(2400000.5, 50123.9999)
    @test isapprox(rbp[1], 0.9999995505176007047, atol = 1e-12)
    @test isapprox(rbp[2], 0.8695404617348208406e-3, atol = 1e-14)
    @test isapprox(rbp[3], 0.3779735201865589104e-3, atol = 1e-14)
    @test isapprox(rbp[4], -0.8695404723772031414e-3, atol = 1e-14)
    @test isapprox(rbp[5], 0.9999996219496027161, atol = 1e-12)
    @test isapprox(rbp[6], -0.1361752497080270143e-6, atol = 1e-14)
    @test isapprox(rbp[7], -0.3779734957034089490e-3, atol = 1e-14)
    @test isapprox(rbp[8], -0.1924880847894457113e-6, atol = 1e-14)
    @test isapprox(rbp[9], 0.9999999285679971958, atol = 1e-12)
end

# ERFA.pmat76
@testset "pmat76" begin
    rmatp = ERFA.pmat76(2400000.5, 50123.9999)
    @test isapprox(rmatp[1], 0.9999995504328350733, atol = 1e-12)
    @test isapprox(rmatp[2], 0.8696632209480960785e-3, atol = 1e-14)
    @test isapprox(rmatp[3], 0.3779153474959888345e-3, atol = 1e-14)
    @test isapprox(rmatp[4], -0.8696632209485112192e-3, atol = 1e-14)
    @test isapprox(rmatp[5], 0.9999996218428560614, atol = 1e-12)
    @test isapprox(rmatp[6], -0.1643284776111886407e-6, atol = 1e-14)
    @test isapprox(rmatp[7], -0.3779153474950335077e-3, atol = 1e-14)
    @test isapprox(rmatp[8], -0.1643306746147366896e-6, atol = 1e-14)
    @test isapprox(rmatp[9], 0.9999999285899790119, atol = 1e-12)
end

# ERFA.pn
@testset "pn" begin
    r, u = ERFA.pn([0.3,1.2,-2.5])
    @test isapprox(r, 2.789265136196270604, atol = 1e-12)
    @test isapprox(u[1], 0.1075552109073112058, atol = 1e-12)
    @test isapprox(u[2], 0.4302208436292448232, atol = 1e-12)
    @test isapprox(u[3], -0.8962934242275933816, atol = 1e-12)
end

# ERFA.pn00
@testset "pn00" begin
    dpsi = -0.9632552291149335877e-5
    deps =  0.4063197106621141414e-4
    epsa, rb, rp, rbp, rn, rbpn = ERFA.pn00(2400000.5, 53736.0, dpsi, deps)
    @test isapprox(epsa, 0.4090791789404229916, atol = 1e-12)
    @test isapprox(rb[1], 0.9999999999999942498, atol = 1e-12)
    @test isapprox(rb[2], -0.7078279744199196626e-7, atol = 1e-18)
    @test isapprox(rb[3], 0.8056217146976134152e-7, atol = 1e-18)
    @test isapprox(rb[4], 0.7078279477857337206e-7, atol = 1e-18)
    @test isapprox(rb[5], 0.9999999999999969484, atol = 1e-12)
    @test isapprox(rb[6], 0.3306041454222136517e-7, atol = 1e-18)
    @test isapprox(rb[7], -0.8056217380986972157e-7, atol = 1e-18)
    @test isapprox(rb[8], -0.3306040883980552500e-7, atol = 1e-18)
    @test isapprox(rb[9], 0.9999999999999962084, atol = 1e-12)
    @test isapprox(rp[1], 0.9999989300532289018, atol = 1e-12)
    @test isapprox(rp[2], -0.1341647226791824349e-2, atol = 1e-14)
    @test isapprox(rp[3], -0.5829880927190296547e-3, atol = 1e-14)
    @test isapprox(rp[4], 0.1341647231069759008e-2, atol = 1e-14)
    @test isapprox(rp[5], 0.9999990999908750433, atol = 1e-12)
    @test isapprox(rp[6], -0.3837444441583715468e-6, atol = 1e-14)
    @test isapprox(rp[7], 0.5829880828740957684e-3, atol = 1e-14)
    @test isapprox(rp[8], -0.3984203267708834759e-6, atol = 1e-14)
    @test isapprox(rp[9], 0.9999998300623538046, atol = 1e-12)
    @test isapprox(rbp[1], 0.9999989300052243993, atol = 1e-12)
    @test isapprox(rbp[2], -0.1341717990239703727e-2, atol = 1e-14)
    @test isapprox(rbp[3], -0.5829075749891684053e-3, atol = 1e-14)
    @test isapprox(rbp[4], 0.1341718013831739992e-2, atol = 1e-14)
    @test isapprox(rbp[5], 0.9999990998959191343, atol = 1e-12)
    @test isapprox(rbp[6], -0.3505759733565421170e-6, atol = 1e-14)
    @test isapprox(rbp[7], 0.5829075206857717883e-3, atol = 1e-14)
    @test isapprox(rbp[8], -0.4315219955198608970e-6, atol = 1e-14)
    @test isapprox(rbp[9], 0.9999998301093036269, atol = 1e-12)
    @test isapprox(rn[1], 0.9999999999536069682, atol = 1e-12)
    @test isapprox(rn[2], 0.8837746144872140812e-5, atol = 1e-16)
    @test isapprox(rn[3], 0.3831488838252590008e-5, atol = 1e-16)
    @test isapprox(rn[4], -0.8837590456633197506e-5, atol = 1e-16)
    @test isapprox(rn[5], 0.9999999991354692733, atol = 1e-12)
    @test isapprox(rn[6], -0.4063198798559573702e-4, atol = 1e-16)
    @test isapprox(rn[7], -0.3831847930135328368e-5, atol = 1e-16)
    @test isapprox(rn[8], 0.4063195412258150427e-4, atol = 1e-16)
    @test isapprox(rn[9], 0.9999999991671806225, atol = 1e-12)
    @test isapprox(rbpn[1], 0.9999989440499982806, atol = 1e-12)
    @test isapprox(rbpn[2], -0.1332880253640848301e-2, atol = 1e-14)
    @test isapprox(rbpn[3], -0.5790760898731087295e-3, atol = 1e-14)
    @test isapprox(rbpn[4], 0.1332856746979948745e-2, atol = 1e-14)
    @test isapprox(rbpn[5], 0.9999991109064768883, atol = 1e-12)
    @test isapprox(rbpn[6], -0.4097740555723063806e-4, atol = 1e-14)
    @test isapprox(rbpn[7], 0.5791301929950205000e-3, atol = 1e-14)
    @test isapprox(rbpn[8], 0.4020553681373702931e-4, atol = 1e-14)
    @test isapprox(rbpn[9], 0.9999998314958529887, atol = 1e-12)
end

# ERFA.pn00a
@testset "pn00a" begin
    dpsi, deps, epsa, rb, rp, rbp, rn, rbpn = ERFA.pn00a(2400000.5, 53736.0)
    @test isapprox(dpsi, -0.9630909107115518431e-5, atol = 1e-12)
    @test isapprox(deps, 0.4063239174001678710e-4, atol = 1e-12)
    @test isapprox(epsa, 0.4090791789404229916, atol = 1e-12)
    @test isapprox(rb[1], 0.9999999999999942498, atol = 1e-12)
    @test isapprox(rb[2], -0.7078279744199196626e-7, atol = 1e-16)
    @test isapprox(rb[3], 0.8056217146976134152e-7, atol = 1e-16)
    @test isapprox(rb[4], 0.7078279477857337206e-7, atol = 1e-16)
    @test isapprox(rb[5], 0.9999999999999969484, atol = 1e-12)
    @test isapprox(rb[6], 0.3306041454222136517e-7, atol = 1e-16)
    @test isapprox(rb[7], -0.8056217380986972157e-7, atol = 1e-16)
    @test isapprox(rb[8], -0.3306040883980552500e-7, atol = 1e-16)
    @test isapprox(rb[9], 0.9999999999999962084, atol = 1e-12)
    @test isapprox(rp[1], 0.9999989300532289018, atol = 1e-12)
    @test isapprox(rp[2], -0.1341647226791824349e-2, atol = 1e-14)
    @test isapprox(rp[3], -0.5829880927190296547e-3, atol = 1e-14)
    @test isapprox(rp[4], 0.1341647231069759008e-2, atol = 1e-14)
    @test isapprox(rp[5], 0.9999990999908750433, atol = 1e-12)
    @test isapprox(rp[6], -0.3837444441583715468e-6, atol = 1e-14)
    @test isapprox(rp[7], 0.5829880828740957684e-3, atol = 1e-14)
    @test isapprox(rp[8], -0.3984203267708834759e-6, atol = 1e-14)
    @test isapprox(rp[9], 0.9999998300623538046, atol = 1e-12)
    @test isapprox(rbp[1], 0.9999989300052243993, atol = 1e-12)
    @test isapprox(rbp[2], -0.1341717990239703727e-2, atol = 1e-14)
    @test isapprox(rbp[3], -0.5829075749891684053e-3, atol = 1e-14)
    @test isapprox(rbp[4], 0.1341718013831739992e-2, atol = 1e-14)
    @test isapprox(rbp[5], 0.9999990998959191343, atol = 1e-12)
    @test isapprox(rbp[6], -0.3505759733565421170e-6, atol = 1e-14)
    @test isapprox(rbp[7], 0.5829075206857717883e-3, atol = 1e-14)
    @test isapprox(rbp[8], -0.4315219955198608970e-6, atol = 1e-14)
    @test isapprox(rbp[9], 0.9999998301093036269, atol = 1e-12)
    @test isapprox(rn[1], 0.9999999999536227949, atol = 1e-12)
    @test isapprox(rn[2], 0.8836238544090873336e-5, atol = 1e-14)
    @test isapprox(rn[3], 0.3830835237722400669e-5, atol = 1e-14)
    @test isapprox(rn[4], -0.8836082880798569274e-5, atol = 1e-14)
    @test isapprox(rn[5], 0.9999999991354655028, atol = 1e-12)
    @test isapprox(rn[6], -0.4063240865362499850e-4, atol = 1e-14)
    @test isapprox(rn[7], -0.3831194272065995866e-5, atol = 1e-14)
    @test isapprox(rn[8], 0.4063237480216291775e-4, atol = 1e-14)
    @test isapprox(rn[9], 0.9999999991671660338, atol = 1e-12)
    @test isapprox(rbpn[1], 0.9999989440476103435, atol = 1e-12)
    @test isapprox(rbpn[2], -0.1332881761240011763e-2, atol = 1e-14)
    @test isapprox(rbpn[3], -0.5790767434730085751e-3, atol = 1e-14)
    @test isapprox(rbpn[4], 0.1332858254308954658e-2, atol = 1e-14)
    @test isapprox(rbpn[5], 0.9999991109044505577, atol = 1e-12)
    @test isapprox(rbpn[6], -0.4097782710396580452e-4, atol = 1e-14)
    @test isapprox(rbpn[7], 0.5791308472168152904e-3, atol = 1e-14)
    @test isapprox(rbpn[8], 0.4020595661591500259e-4, atol = 1e-14)
    @test isapprox(rbpn[9], 0.9999998314954572304, atol = 1e-12)
end

# ERFA.pn06
@testset "pn06" begin
    dpsi = -0.9632552291149335877e-5
    deps =  0.4063197106621141414e-4
    epsa, rb, rp, rbp, rn, rbpn = ERFA.pn06(2400000.5, 53736.0, dpsi, deps)
    @test isapprox(epsa, 0.4090789763356509926, atol = 1e-12)
    @test isapprox(rb[1], 0.9999999999999942497, atol = 1e-12)
    @test isapprox(rb[2], -0.7078368960971557145e-7, atol = 1e-14)
    @test isapprox(rb[3], 0.8056213977613185606e-7, atol = 1e-14)
    @test isapprox(rb[4], 0.7078368694637674333e-7, atol = 1e-14)
    @test isapprox(rb[5], 0.9999999999999969484, atol = 1e-12)
    @test isapprox(rb[6], 0.3305943742989134124e-7, atol = 1e-14)
    @test isapprox(rb[7], -0.8056214211620056792e-7, atol = 1e-14)
    @test isapprox(rb[8], -0.3305943172740586950e-7, atol = 1e-14)
    @test isapprox(rb[9], 0.9999999999999962084, atol = 1e-12)
    @test isapprox(rp[1], 0.9999989300536854831, atol = 1e-12)
    @test isapprox(rp[2], -0.1341646886204443795e-2, atol = 1e-14)
    @test isapprox(rp[3], -0.5829880933488627759e-3, atol = 1e-14)
    @test isapprox(rp[4], 0.1341646890569782183e-2, atol = 1e-14)
    @test isapprox(rp[5], 0.9999990999913319321, atol = 1e-12)
    @test isapprox(rp[6], -0.3835944216374477457e-6, atol = 1e-14)
    @test isapprox(rp[7], 0.5829880833027867368e-3, atol = 1e-14)
    @test isapprox(rp[8], -0.3985701514686976112e-6, atol = 1e-14)
    @test isapprox(rp[9], 0.9999998300623534950, atol = 1e-12)
    @test isapprox(rbp[1], 0.9999989300056797893, atol = 1e-12)
    @test isapprox(rbp[2], -0.1341717650545059598e-2, atol = 1e-14)
    @test isapprox(rbp[3], -0.5829075756493728856e-3, atol = 1e-14)
    @test isapprox(rbp[4], 0.1341717674223918101e-2, atol = 1e-14)
    @test isapprox(rbp[5], 0.9999990998963748448, atol = 1e-12)
    @test isapprox(rbp[6], -0.3504269280170069029e-6, atol = 1e-14)
    @test isapprox(rbp[7], 0.5829075211461454599e-3, atol = 1e-14)
    @test isapprox(rbp[8], -0.4316708436255949093e-6, atol = 1e-14)
    @test isapprox(rbp[9], 0.9999998301093032943, atol = 1e-12)
    @test isapprox(rn[1], 0.9999999999536069682, atol = 1e-12)
    @test isapprox(rn[2], 0.8837746921149881914e-5, atol = 1e-14)
    @test isapprox(rn[3], 0.3831487047682968703e-5, atol = 1e-14)
    @test isapprox(rn[4], -0.8837591232983692340e-5, atol = 1e-14)
    @test isapprox(rn[5], 0.9999999991354692664, atol = 1e-12)
    @test isapprox(rn[6], -0.4063198798558931215e-4, atol = 1e-14)
    @test isapprox(rn[7], -0.3831846139597250235e-5, atol = 1e-14)
    @test isapprox(rn[8], 0.4063195412258792914e-4, atol = 1e-14)
    @test isapprox(rn[9], 0.9999999991671806293, atol = 1e-12)
    @test isapprox(rbpn[1], 0.9999989440504506688, atol = 1e-12)
    @test isapprox(rbpn[2], -0.1332879913170492655e-2, atol = 1e-14)
    @test isapprox(rbpn[3], -0.5790760923225655753e-3, atol = 1e-14)
    @test isapprox(rbpn[4], 0.1332856406595754748e-2, atol = 1e-14)
    @test isapprox(rbpn[5], 0.9999991109069366795, atol = 1e-12)
    @test isapprox(rbpn[6], -0.4097725651142641812e-4, atol = 1e-14)
    @test isapprox(rbpn[7], 0.5791301952321296716e-3, atol = 1e-14)
    @test isapprox(rbpn[8], 0.4020538796195230577e-4, atol = 1e-14)
    @test isapprox(rbpn[9], 0.9999998314958576778, atol = 1e-12)
end

# ERFA.pn06a
@testset "pn06a" begin
    dpsi, deps, epsa, rb, rp, rbp, rn, rbpn = ERFA.pn06a(2400000.5, 53736.0)
    @test isapprox(dpsi, -0.9630912025820308797e-5, atol = 1e-12)
    @test isapprox(deps, 0.4063238496887249798e-4, atol = 1e-12)
    @test isapprox(epsa, 0.4090789763356509926, atol = 1e-12)
    @test isapprox(rb[1], 0.9999999999999942497, atol = 1e-12)
    @test isapprox(rb[2], -0.7078368960971557145e-7, atol = 1e-14)
    @test isapprox(rb[3], 0.8056213977613185606e-7, atol = 1e-14)
    @test isapprox(rb[4], 0.7078368694637674333e-7, atol = 1e-14)
    @test isapprox(rb[5], 0.9999999999999969484, atol = 1e-12)
    @test isapprox(rb[6], 0.3305943742989134124e-7, atol = 1e-14)
    @test isapprox(rb[7], -0.8056214211620056792e-7, atol = 1e-14)
    @test isapprox(rb[8], -0.3305943172740586950e-7, atol = 1e-14)
    @test isapprox(rb[9], 0.9999999999999962084, atol = 1e-12)
    @test isapprox(rp[1], 0.9999989300536854831, atol = 1e-12)
    @test isapprox(rp[2], -0.1341646886204443795e-2, atol = 1e-14)
    @test isapprox(rp[3], -0.5829880933488627759e-3, atol = 1e-14)
    @test isapprox(rp[4], 0.1341646890569782183e-2, atol = 1e-14)
    @test isapprox(rp[5], 0.9999990999913319321, atol = 1e-12)
    @test isapprox(rp[6], -0.3835944216374477457e-6, atol = 1e-14)
    @test isapprox(rp[7], 0.5829880833027867368e-3, atol = 1e-14)
    @test isapprox(rp[8], -0.3985701514686976112e-6, atol = 1e-14)
    @test isapprox(rp[9], 0.9999998300623534950, atol = 1e-12)
    @test isapprox(rbp[1], 0.9999989300056797893, atol = 1e-12)
    @test isapprox(rbp[2], -0.1341717650545059598e-2, atol = 1e-14)
    @test isapprox(rbp[3], -0.5829075756493728856e-3, atol = 1e-14)
    @test isapprox(rbp[4], 0.1341717674223918101e-2, atol = 1e-14)
    @test isapprox(rbp[5], 0.9999990998963748448, atol = 1e-12)
    @test isapprox(rbp[6], -0.3504269280170069029e-6, atol = 1e-14)
    @test isapprox(rbp[7], 0.5829075211461454599e-3, atol = 1e-14)
    @test isapprox(rbp[8], -0.4316708436255949093e-6, atol = 1e-14)
    @test isapprox(rbp[9], 0.9999998301093032943, atol = 1e-12)
    @test isapprox(rn[1], 0.9999999999536227668, atol = 1e-12)
    @test isapprox(rn[2], 0.8836241998111535233e-5, atol = 1e-14)
    @test isapprox(rn[3], 0.3830834608415287707e-5, atol = 1e-14)
    @test isapprox(rn[4], -0.8836086334870740138e-5, atol = 1e-14)
    @test isapprox(rn[5], 0.9999999991354657474, atol = 1e-12)
    @test isapprox(rn[6], -0.4063240188248455065e-4, atol = 1e-14)
    @test isapprox(rn[7], -0.3831193642839398128e-5, atol = 1e-14)
    @test isapprox(rn[8], 0.4063236803101479770e-4, atol = 1e-14)
    @test isapprox(rn[9], 0.9999999991671663114, atol = 1e-12)
    @test isapprox(rbpn[1], 0.9999989440480669738, atol = 1e-12)
    @test isapprox(rbpn[2], -0.1332881418091915973e-2, atol = 1e-14)
    @test isapprox(rbpn[3], -0.5790767447612042565e-3, atol = 1e-14)
    @test isapprox(rbpn[4], 0.1332857911250989133e-2, atol = 1e-14)
    @test isapprox(rbpn[5], 0.9999991109049141908, atol = 1e-12)
    @test isapprox(rbpn[6], -0.4097767128546784878e-4, atol = 1e-14)
    @test isapprox(rbpn[7], 0.5791308482835292617e-3, atol = 1e-14)
    @test isapprox(rbpn[8], 0.4020580099454020310e-4, atol = 1e-14)
    @test isapprox(rbpn[9], 0.9999998314954628695, atol = 1e-12)
end

# ERFA.pnm00a
@testset "pnm00a" begin
    rbpn = ERFA.pnm00a(2400000.5, 50123.9999)
    @test isapprox(rbpn[1], 0.9999995832793134257, atol = 1e-12)
    @test isapprox(rbpn[2], 0.8372384254137809439e-3, atol = 1e-14)
    @test isapprox(rbpn[3], 0.3639684306407150645e-3, atol = 1e-14)
    @test isapprox(rbpn[4], -0.8372535226570394543e-3, atol = 1e-14)
    @test isapprox(rbpn[5], 0.9999996486491582471, atol = 1e-12)
    @test isapprox(rbpn[6], 0.4132915262664072381e-4, atol = 1e-14)
    @test isapprox(rbpn[7], -0.3639337004054317729e-3, atol = 1e-14)
    @test isapprox(rbpn[8], -0.4163386925461775873e-4, atol = 1e-14)
    @test isapprox(rbpn[9], 0.9999999329094390695, atol = 1e-12)
end

# ERFA.pn00b
@testset "pn00b" begin
    dpsi, deps, epsa, rb, rp, rbp, rn, rbpn = ERFA.pn00b(2400000.5, 53736.0)
    @test isapprox(dpsi, -0.9632552291148362783e-5, atol = 1e-12)
    @test isapprox(deps, 0.4063197106621159367e-4, atol = 1e-12)
    @test isapprox(epsa, 0.4090791789404229916, atol = 1e-12)
    @test isapprox(rb[1], 0.9999999999999942498, atol = 1e-12)
    @test isapprox(rb[2], -0.7078279744199196626e-7, atol = 1e-16)
    @test isapprox(rb[3], 0.8056217146976134152e-7, atol = 1e-16)
    @test isapprox(rb[4], 0.7078279477857337206e-7, atol = 1e-16)
    @test isapprox(rb[5], 0.9999999999999969484, atol = 1e-12)
    @test isapprox(rb[6], 0.3306041454222136517e-7, atol = 1e-16)
    @test isapprox(rb[7], -0.8056217380986972157e-7, atol = 1e-16)
    @test isapprox(rb[8], -0.3306040883980552500e-7, atol = 1e-16)
    @test isapprox(rb[9], 0.9999999999999962084, atol = 1e-12)
    @test isapprox(rp[1], 0.9999989300532289018, atol = 1e-12)
    @test isapprox(rp[2], -0.1341647226791824349e-2, atol = 1e-14)
    @test isapprox(rp[3], -0.5829880927190296547e-3, atol = 1e-14)
    @test isapprox(rp[4], 0.1341647231069759008e-2, atol = 1e-14)
    @test isapprox(rp[5], 0.9999990999908750433, atol = 1e-12)
    @test isapprox(rp[6], -0.3837444441583715468e-6, atol = 1e-14)
    @test isapprox(rp[7], 0.5829880828740957684e-3, atol = 1e-14)
    @test isapprox(rp[8], -0.3984203267708834759e-6, atol = 1e-14)
    @test isapprox(rp[9], 0.9999998300623538046, atol = 1e-12)
    @test isapprox(rbp[1], 0.9999989300052243993, atol = 1e-12)
    @test isapprox(rbp[2], -0.1341717990239703727e-2, atol = 1e-14)
    @test isapprox(rbp[3], -0.5829075749891684053e-3, atol = 1e-14)
    @test isapprox(rbp[4], 0.1341718013831739992e-2, atol = 1e-14)
    @test isapprox(rbp[5], 0.9999990998959191343, atol = 1e-12)
    @test isapprox(rbp[6], -0.3505759733565421170e-6, atol = 1e-14)
    @test isapprox(rbp[7], 0.5829075206857717883e-3, atol = 1e-14)
    @test isapprox(rbp[8], -0.4315219955198608970e-6, atol = 1e-14)
    @test isapprox(rbp[9], 0.9999998301093036269, atol = 1e-12)
    @test isapprox(rn[1], 0.9999999999536069682, atol = 1e-12)
    @test isapprox(rn[2], 0.8837746144871248011e-5, atol = 1e-14)
    @test isapprox(rn[3], 0.3831488838252202945e-5, atol = 1e-14)
    @test isapprox(rn[4], -0.8837590456632304720e-5, atol = 1e-14)
    @test isapprox(rn[5], 0.9999999991354692733, atol = 1e-12)
    @test isapprox(rn[6], -0.4063198798559591654e-4, atol = 1e-14)
    @test isapprox(rn[7], -0.3831847930134941271e-5, atol = 1e-14)
    @test isapprox(rn[8], 0.4063195412258168380e-4, atol = 1e-14)
    @test isapprox(rn[9], 0.9999999991671806225, atol = 1e-12)
    @test isapprox(rbpn[1], 0.9999989440499982806, atol = 1e-12)
    @test isapprox(rbpn[2], -0.1332880253640849194e-2, atol = 1e-14)
    @test isapprox(rbpn[3], -0.5790760898731091166e-3, atol = 1e-14)
    @test isapprox(rbpn[4], 0.1332856746979949638e-2, atol = 1e-14)
    @test isapprox(rbpn[5], 0.9999991109064768883, atol = 1e-12)
    @test isapprox(rbpn[6], -0.4097740555723081811e-4, atol = 1e-14)
    @test isapprox(rbpn[7], 0.5791301929950208873e-3, atol = 1e-14)
    @test isapprox(rbpn[8], 0.4020553681373720832e-4, atol = 1e-14)
    @test isapprox(rbpn[9], 0.9999998314958529887, atol = 1e-12)
end

# ERFA.pnm00b
@testset "pnm00b" begin
    rbpn = ERFA.pnm00b(2400000.5, 50123.9999)
    @test isapprox(rbpn[1], 0.9999995832776208280, atol = 1e-12)
    @test isapprox(rbpn[2], 0.8372401264429654837e-3, atol = 1e-14)
    @test isapprox(rbpn[3], 0.3639691681450271771e-3, atol = 1e-14)
    @test isapprox(rbpn[4], -0.8372552234147137424e-3, atol = 1e-14)
    @test isapprox(rbpn[5], 0.9999996486477686123, atol = 1e-12)
    @test isapprox(rbpn[6], 0.4132832190946052890e-4, atol = 1e-14)
    @test isapprox(rbpn[7], -0.3639344385341866407e-3, atol = 1e-14)
    @test isapprox(rbpn[8], -0.4163303977421522785e-4, atol = 1e-14)
    @test isapprox(rbpn[9], 0.9999999329092049734, atol = 1e-12)
end

# ERFA.pnm06a
@testset "pnm06a" begin
    rbpn = ERFA.pnm06a(2400000.5, 50123.9999)
    @test isapprox(rbpn[1], 0.9999995832794205484, atol = 1e-12)
    @test isapprox(rbpn[2], 0.8372382772630962111e-3, atol = 1e-14)
    @test isapprox(rbpn[3], 0.3639684771140623099e-3, atol = 1e-14)
    @test isapprox(rbpn[4], -0.8372533744743683605e-3, atol = 1e-14)
    @test isapprox(rbpn[5], 0.9999996486492861646, atol = 1e-12)
    @test isapprox(rbpn[6], 0.4132905944611019498e-4, atol = 1e-14)
    @test isapprox(rbpn[7], -0.3639337469629464969e-3, atol = 1e-14)
    @test isapprox(rbpn[8], -0.4163377605910663999e-4, atol = 1e-14)
    @test isapprox(rbpn[9], 0.9999999329094260057, atol = 1e-12)
end

# ERFA.pnm80
@testset "pnm80" begin
    rmatpn = ERFA.pnm80(2400000.5, 50123.9999)
    @test isapprox(rmatpn[1], 0.9999995831934611169, atol = 1e-12)
    @test isapprox(rmatpn[2], 0.8373654045728124011e-3, atol = 1e-14)
    @test isapprox(rmatpn[3], 0.3639121916933106191e-3, atol = 1e-14)
    @test isapprox(rmatpn[4], -0.8373804896118301316e-3, atol = 1e-14)
    @test isapprox(rmatpn[5], 0.9999996485439674092, atol = 1e-12)
    @test isapprox(rmatpn[6], 0.4130202510421549752e-4, atol = 1e-14)
    @test isapprox(rmatpn[7], -0.3638774789072144473e-3, atol = 1e-14)
    @test isapprox(rmatpn[8], -0.4160674085851722359e-4, atol = 1e-14)
    @test isapprox(rmatpn[9], 0.9999999329310274805, atol = 1e-12)
end

# ERFA.pom00
@testset "pom00" begin
    xp =  2.55060238e-7
    yp =  1.860359247e-6
    sp = -0.1367174580728891460e-10
    rpom = ERFA.pom00(xp, yp, sp)
    @test isapprox(rpom[1], 0.9999999999999674721, atol = 1e-12)
    @test isapprox(rpom[2], -0.1367174580728846989e-10, atol = 1e-16)
    @test isapprox(rpom[3], 0.2550602379999972345e-6, atol = 1e-16)
    @test isapprox(rpom[4], 0.1414624947957029801e-10, atol = 1e-16)
    @test isapprox(rpom[5], 0.9999999999982695317, atol = 1e-12)
    @test isapprox(rpom[6], -0.1860359246998866389e-5, atol = 1e-16)
    @test isapprox(rpom[7], -0.2550602379741215021e-6, atol = 1e-16)
    @test isapprox(rpom[8], 0.1860359247002414021e-5, atol = 1e-16)
    @test isapprox(rpom[9], 0.9999999999982370039, atol = 1e-12)
end

# ERFA.ppp
@testset "ppp" begin
    apb = ERFA.ppp([2.0,2.0,3.0], [1.0,3.0,4.0])
    @test isapprox(apb[1], 3.0, atol = 1e-12)
    @test isapprox(apb[2], 5.0, atol = 1e-12)
    @test isapprox(apb[3], 7.0, atol = 1e-12)
end

# ERFA.ppsp
@testset "ppsp" begin
    apsb = ERFA.ppsp([2.0,2.0,3.0], 5.0, [1.0,3.0,4.0])
    @test isapprox(apsb[1], 7.0, atol = 1e-12)
    @test isapprox(apsb[2], 17.0, atol = 1e-12)
    @test isapprox(apsb[3], 23.0, atol = 1e-12)
end

# ERFA.pr00
@testset "pr00" begin
    dpsipr, depspr = ERFA.pr00(2400000.5, 53736.)
    @test isapprox(dpsipr, -0.8716465172668347629e-7, atol = 1e-22)
    @test isapprox(depspr, -0.7342018386722813087e-8, atol = 1e-22)
end

# ERFA.prec76
@testset "prec76" begin
    ep01 = 2400000.5
    ep02 = 33282.0
    ep11 = 2400000.5
    ep12 = 51544.0
    zeta, z, theta = ERFA.prec76(ep01, ep02, ep11, ep12)
    @test isapprox(zeta, 0.5588961642000161243e-2, atol = 1e-12)
    @test isapprox(z, 0.5589922365870680624e-2, atol = 1e-12)
    @test isapprox(theta, 0.4858945471687296760e-2, atol = 1e-12)
end

# ERFA.pv2p
@testset "pv2p" begin
    p = ERFA.pv2p([[0.3,1.2,-2.5];[-0.5,3.1,0.9]])
    @test isapprox(p[1], 0.3, atol = 0.0)
    @test isapprox(p[2], 1.2, atol = 0.0)
    @test isapprox(p[3], -2.5, atol = 0.0)
end

# ERFA.pv2s
@testset "pv2s" begin
    pv = [[-0.4514964673880165,0.03093394277342585,0.05594668105108779];
          [1.292270850663260e-5,2.652814182060692e-6,2.568431853930293e-6]]
    theta, phi, r, td, pd, rd = ERFA.pv2s(pv)
    @test isapprox(theta, 3.073185307179586515, atol = 1e-12)
    @test isapprox(phi, 0.1229999999999999992, atol = 1e-12)
    @test isapprox(r, 0.4559999999999999757, atol = 1e-12)
    @test isapprox(td, -0.7800000000000000364e-5, atol = 1e-16)
    @test isapprox(pd, 0.9010000000000001639e-5, atol = 1e-16)
    @test isapprox(rd, -0.1229999999999999832e-4, atol = 1e-16)
end

# ERFA.pvdpv
@testset "pvdpv" begin
    a = [[2.,2.,3.];[6.,0.,4.]]
    b = [[1.,3.,4.];[0.,2.,8.]]
    adb = ERFA.pvdpv(a, b)
    @test isapprox(adb[1], 20.0, atol = 1e-12)
    @test isapprox(adb[2], 50.0, atol = 1e-12)
end

# ERFA.pvm
@testset "pvm" begin
    pv = [[0.3,1.2,-2.5];[0.45,-0.25,1.1]]
    r, s = ERFA.pvm(pv)
    @test isapprox(r, 2.789265136196270604, atol = 1e-12)
    @test isapprox(s, 1.214495780149111922, atol = 1e-12)
end

# ERFA.pvmpv
@testset "pvmpv" begin
    a = [[2.0,2.0,3.0];[5.0,6.0,3.0]]
    b = [[1.0,3.0,4.0];[3.0,2.0,1.0]]
    amb = ERFA.pvmpv(a, b)
    @test isapprox(amb[1], 1.0, atol = 1e-12)
    @test isapprox(amb[2], -1.0, atol = 1e-12)
    @test isapprox(amb[3], -1.0, atol = 1e-12)
    @test isapprox(amb[4], 2.0, atol = 1e-12)
    @test isapprox(amb[5], 4.0, atol = 1e-12)
    @test isapprox(amb[6], 2.0, atol = 1e-12)
end

# ERFA.pvppv
@testset "pvppv" begin
    a = [[2.0,2.0,3.0];[5.0,6.0,3.0]]
    b = [[1.0,3.0,4.0];[3.0,2.0,1.0]]
    apb = ERFA.pvppv(a, b)
    @test isapprox(apb[1], 3.0, atol = 1e-12)
    @test isapprox(apb[2], 5.0, atol = 1e-12)
    @test isapprox(apb[3], 7.0, atol = 1e-12)
    @test isapprox(apb[4], 8.0, atol = 1e-12)
    @test isapprox(apb[5], 8.0, atol = 1e-12)
    @test isapprox(apb[6], 4.0, atol = 1e-12)
end

# ERFA.pvxpv
@testset "pvxpv" begin
    a = [[2.0,2.0,3.0];[6.0,0.0,4.0]]
    b = [[1.0,3.0,4.0];[0.0,2.0,8.0]]
    axb = ERFA.pvxpv(a, b)
    @test isapprox(axb[1], -1.0, atol = 1e-12)
    @test isapprox(axb[2], -5.0, atol = 1e-12)
    @test isapprox(axb[3], 4.0, atol = 1e-12)
    @test isapprox(axb[4], -2.0, atol = 1e-12)
    @test isapprox(axb[5], -36.0, atol = 1e-12)
    @test isapprox(axb[6], 22.0, atol = 1e-12)
end

# ERFA.pvstar
@testset "pvstar" begin
    pv = [[126668.5912743160601,2136.792716839935195,-245251.2339876830091];
          [-0.4051854035740712739e-2,-0.6253919754866173866e-2,0.1189353719774107189e-1]]
    ra, dec, pmr, pmd, px, rv = ERFA.pvstar(pv)
    @test isapprox(ra, 0.1686756e-1, atol = 1e-12)
    @test isapprox(dec, -1.093989828, atol = 1e-12)
    @test isapprox(pmr, -0.1783235160000472788e-4, atol = 1e-16)
    @test isapprox(pmd, 0.2336024047000619347e-5, atol = 1e-16)
    @test isapprox(px, 0.74723, atol = 1e-12)
    @test isapprox(rv, -21.60000010107306010, atol = 1e-11)
end

# ERFA.pvtob
@testset "pvtob" begin
    elong = 2.0
    phi = 0.5
    hm = 3000.0
    xp = 1e-6
    yp = -0.5e-6
    sp = 1e-8
    theta = 5.0
    pv = ERFA.pvtob(elong, phi, hm, xp, yp, sp, theta)
    @test isapprox(pv[1], 4225081.367071159207, atol = 1e-5)
    @test isapprox(pv[2], 3681943.215856198144, atol = 1e-5)
    @test isapprox(pv[3], 3041149.399241260785, atol = 1e-5)
    @test isapprox(pv[4], -268.4915389365998787, atol = 1e-9)
    @test isapprox(pv[5], 308.0977983288903123, atol = 1e-9)
    @test isapprox(pv[6], 0, atol = 1e-0)
end

# ERFA.pvu
@testset "pvu" begin
    dt = 2920.0
    pv = [[126668.5912743160734,2136.792716839935565,-245251.2339876830229];
          [-0.4051854035740713039e-2,-0.6253919754866175788e-2,0.1189353719774107615e-1]]
    upv = ERFA.pvu(dt, pv)
    @test isapprox(upv[1], 126656.7598605317105, atol = 1e-12)
    @test isapprox(upv[2], 2118.531271155726332, atol = 1e-12)
    @test isapprox(upv[3], -245216.5048590656190, atol = 1e-12)
    @test isapprox(upv[4], -0.4051854035740713039e-2, atol = 1e-12)
    @test isapprox(upv[5], -0.6253919754866175788e-2, atol = 1e-12)
    @test isapprox(upv[6], 0.1189353719774107615e-1, atol = 1e-12)
end

# ERFA.pvup
@testset "pvup" begin
    dt = 2920.0
    pv = [[126668.5912743160734,2136.792716839935565,-245251.2339876830229];
          [-0.4051854035740713039e-2,-0.6253919754866175788e-2,0.1189353719774107615e-1]]
    p = ERFA.pvup(dt, pv)
    @test isapprox(p[1], 126656.7598605317105, atol = 1e-12)
    @test isapprox(p[2], 2118.531271155726332, atol = 1e-12)
    @test isapprox(p[3], -245216.5048590656190, atol = 1e-12)
end

# ERFA.pxp
@testset "pxp" begin
    axb = ERFA.pxp([2.0,2.0,3.0], [1.0,3.0,4.0])
    @test isapprox(axb[1], -1.0, atol = 1e-12)
    @test isapprox(axb[2], -5.0, atol = 1e-12)
    @test isapprox(axb[3], 4.0, atol = 1e-12)
end

