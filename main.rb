require 'test/unit'
require 'watir'
require 'DBI'

def datenow()
 year=DateTime.now.year.to_s
 mon=DateTime.now.month.to_s
 day=DateTime.now.day.to_s
 hour=DateTime.now.hour.to_s
 min=DateTime.now.min.to_s
 sec=DateTime.now.sec.to_s      
 #puts year+"-"+mon+"-"+day+" "+hour+":"+min+":"+sec
 return year+"-"+mon+"-"+day+" "+hour+":"+min+":"+sec
 end

def getweekprice(startday,flightfrom,flightto)
    outfile = File.open("c:\\tmp.csv","a")

    startday=startday+3
    
   city = {
 "sh" => "%e4%b8%8a%e6%b5%b7",
"wlmq" => "%e4%b9%8c%e9%b2%81%e6%9c%a8%e9%bd%90"
}

 city["上海"]="%e4%b8%8a%e6%b5%b7"
 city["shanghai"]="%e4%b8%8a%e6%b5%b7"
 city["北京"]="%e5%8c%97%e4%ba%ac"
 city["beijing"]="%e5%8c%97%e4%ba%ac"
 city["九寨沟"]="%e9%bb%84%e9%be%99"
 city["jiuzhaigou"]="%e9%bb%84%e9%be%99"
 city["昆明"]="%e6%98%86%e6%98%8e"
 city["kunming"]="%e6%98%86%e6%98%8e"
 city["沈阳"]="%e6%b2%88%e9%98%b3"
 city["shengyang"]="%e6%b2%88%e9%98%b3"
 city["重庆"]="%e9%87%8d%e5%ba%86"
 city["chongqing"]="%e9%87%8d%e5%ba%86"
 city["香港"]="%e9%a6%99%e6%b8%af"
 city["xianggang"]="%e9%a6%99%e6%b8%af"
 city["青岛"]="%e9%9d%92%e5%b2%9b"
 city["qingdao"]="%e9%9d%92%e5%b2%9b"
 city["大连"]="%e5%a4%a7%e8%bf%9e"
 city["dalian"]="%e5%a4%a7%e8%bf%9e"
 city["东京"]="%e4%b8%9c%e4%ba%ac"
 city["dongjing"]="%e4%b8%9c%e4%ba%ac"
 city["厦门"]="%e5%8e%a6%e9%97%a8"
 city["xiameng"]="%e5%8e%a6%e9%97%a8"
 city["悉尼"]="%e6%82%89%e5%b0%bc"
 city["xini"]="%e6%82%89%e5%b0%bc"
 city["曼谷"]="%e6%9b%bc%e8%b0%b7"
 city["mangu"]="%e6%9b%bc%e8%b0%b7"
 city["南京"]="%e5%8d%97%e4%ba%ac"
 city["nanjing"]="%e5%8d%97%e4%ba%ac"
 city["杭州"]="%e6%9d%ad%e5%b7%9e"
 city["hangzhou"]="%e6%9d%ad%e5%b7%9e"
 city["成都"]="%e6%88%90%e9%83%bd"
 city["chengdu"]="%e6%88%90%e9%83%bd"
 city["乌鲁木齐"]="%e4%b9%8c%e9%b2%81%e6%9c%a8%e9%bd%90"
 city["wulumuqi"]="%e4%b9%8c%e9%b2%81%e6%9c%a8%e9%bd%90"
 city["新加坡"]="%e6%96%b0%e5%8a%a0%e5%9d%a1"
 city["xinjiapo"]="%e6%96%b0%e5%8a%a0%e5%9d%a1"
 city["悉尼"]="%e6%82%89%e5%b0%bc"
 city["xini"]="%e6%82%89%e5%b0%bc"
 city["三亚"]="%e4%b8%89%e4%ba%9a"
 city["sanya"]="%e4%b8%89%e4%ba%9a"
 city["海口"]="%e6%b5%b7%e5%8f%a3"
 city["haikou"]="%e6%b5%b7%e5%8f%a3"
 city["西安"]="%e8%a5%bf%e5%ae%89"
 city["xian"]="%e8%a5%bf%e5%ae%89"
 city["长沙"]="%e9%95%bf%e6%b2%99"
 city["changsha"]="%e9%95%bf%e6%b2%99"
 city["武汉"]="%e6%ad%a6%e6%b1%89"
 city["wuhan"]="%e6%ad%a6%e6%b1%89"
 city["kashi"]="%E5%96%80%E4%BB%80"
 city["喀什"]="%E5%96%80%E4%BB%80"


flightfrom_code=city[flightfrom].to_s
flightto_code = city[flightto].to_s 
    
    url="http://flight.qunar.com/site/oneway_list.htm?searchDepartureTime="
    url=url+startday.to_s
    url=url+"&arrivalTime=&searchDepartureAirport="+flightfrom_code
    url=url+"&searchArrivalAirport="
    url=url+flightto_code
    url=url+"&searchType=OneWayFlight&startSearch=true&from=qunarindex"
   sleep 2
   ie = Watir::IE.new
    ie.goto(url)
    
    #ie.goto('http://flight.qunar.com/site/oneway_list.htm?searchDepartureTime=2009-05-29&arrivalTime=2009-07-04&searchDepartureAirport=%E4%B8%8A%E6%B5%B7&searchArrivalAirport=%E4%B9%8C%E9%B2%81%E6%9C%A8%E9%BD%90&searchType=OneWayFlight&startSearch=true&from=qunarindex')
    
    
     #puts "total lis is " + ie.lis.length.to_s
    
    sleep 10
    #puts "total lis after 10sec is "+ ie.lis.length.to_s
    



=begin
#testing code start

 count = 26 
7.times do
     count += 1
     x = ie.lis[count].to_s
     puts count.to_s
     puts x     
     end
 puts "===="
 
 
 count = 40 
7.times do
     count += 1
     x = ie.lis[count].to_s
     puts count.to_s
     puts x     
     end
 puts ie.lis[40].to_s
#testing code end
=end    
    
    
     x1= ie.lis[41].to_s
   
     x1[0..110] = ""
     puts x1
     x1 = x1.gsub("￥","")
     x1 = x1.gsub("折","")
     x1 = x1.gsub("订","")
     x1 = x1.gsub("票","")
     x1 = x1.gsub("      ","")
     x1 = x1.chop()
     x1 = x1.chop()
     x1 = x1.gsub(" ","_SPACE_")      
     fullpricearray=x1.split(/_SPACE_/)
     fullprice= fullpricearray[0].to_f/ fullpricearray[1].to_f*10
     #puts x1
     #puts "full price is "+ fullprice.to_s
    

    

   count = 26    
    7.times do
     count += 1
     x = ie.lis[count].to_s
     x[0..110] = ""
      x = x.gsub(" ","")
      x = x.gsub("￥","RMB")
      x = x.gsub("\n","")
      x = x.gsub("\r","")
      x = x.gsub("t:","")     
     myarray=x.split(/RMB/)
     discountrate=myarray[1].to_f/fullprice
     outputtxt= flightfrom+","+flightto+","+myarray[0]+","+myarray[1]+","+discountrate.to_s
     puts outputtxt
     outfile.puts(outputtxt)

  insertdb("1",datenow() ,flightfrom,flightto,myarray[0],myarray[1],discountrate.to_s)
  #insertdb('1', '2009-04-23 12:05:35', 'sh', 'wlmq', '2009-04-30', '12600')

    


    end
     outfile.close
   

    
    

   
   ie.close
    
end



def getweeksprice(startday, weeknumber,flightfrom,flightto)


sday=startday
#check 16 weeks range.
checkafterweeks=weeknumber
checkafterweeks.times do
  getweekprice(sday,flightfrom,flightto)
  sday=sday+7
                              end
end


def insertdb(id_run, run_date, flightfrom, flightto, flightdate, flightprice,discountrate)
dbh = DBI.connect('DBI:ODBC:qunar','root','password')
insert="INSERT INTO `qunar`.`fly` (`id_run`, `run_date`, `flightfrom`, `flightto`, `flightdate`, `flightprice`,`discountrate`) VALUES ('"+id_run+"', '"+run_date+"', '"+flightfrom+"', '"+flightto+"', '"+flightdate+"', '"+flightprice+  "', '"+ discountrate+      "');"

#puts insert
dbh.do(insert)
end




def getBiweeksprice (startday, weeknumber,flightfrom,flightto)
  getweeksprice(startday, weeknumber,flightfrom,flightto)
  getweeksprice(startday, weeknumber,flightto,flightfrom)
end







# Main program start
sday=Date::civil(2009, 5, 27)
#get 2weeks price start form sday.  getweeksprice(sday,2)

while true
   
   #problem destinations
   #getweeksprice(sday,1,"sh","jiuzhaigou")
   #getweeksprice(sday,1,"sh","xianggang")
   
   getBiweeksprice(sday,4,"sh","wlmq")   
   
 # getBiweeksprice(sday,12,"wlmq","kashi")
   getBiweeksprice(sday,4,"sh","xiameng")
   getBiweeksprice(sday,4,"sh","chongqing")
   getBiweeksprice(sday,4,"sh","kunming")
   getBiweeksprice(sday,4,"sh","xiameng")
   getBiweeksprice(sday,4,"sh","chengdu")
   getBiweeksprice(sday,4,"sh","dalian")
   getBiweeksprice(sday,4,"sh","qingdao")
   getBiweeksprice(sday,4,"sh","haikou")
   getBiweeksprice(sday,4,"sh","xian")

   
=begin
   getBiweeksprice(sday,12,"sh","chongqing")
   getBiweeksprice(sday,12,"sh","kunming")
   getBiweeksprice(sday,12,"sh","xiameng")
   getBiweeksprice(sday,12,"sh","chengdu")
   getBiweeksprice(sday,12,"sh","dalian")
   getBiweeksprice(sday,12,"sh","qingdao")
   getBiweeksprice(sday,12,"sh","haikou")
   getBiweeksprice(sday,12,"sh","xian")
=end

  #getweeksprice(sday,1,"sh","sanya")
   
   #run every 15mins
   sleep 900
end
