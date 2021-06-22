<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5-Star Beachfront Resort</title>
<link href="main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
  integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
  crossorigin="anonymous"
/>
<link rel='stylesheet' href='https://unpkg.com/v-calendar/lib/v-calendar.min.css'>

</head>
<body>
  <div class="top-container">
    <div id="logo">
      <a data-xiti="transverse::logo" href="/"><img width="200" height="36"
        src="https://pullmanphuquoc.com/wp-content/themes/pullman-template/images/logo/logo-pullman.svg"
        alt="Pullman Phu Quoc Beach resort"
      ></a>
    </div>
    <div id="hotel-name">
      <h1>PULLMAN PHU QUOC BEACH RESORT</h1>
    </div>
  </div>

  <div class="main-container">
    <form>
      <div id="booking">
        <div class="check-in">
          CHECK IN <i class="far fa-calendar-alt"></i>
        </div>
        <div class="check-out">
          CHECK OUT <i class="far fa-calendar-alt"></i>
        </div>
        <div id="adults">
          ADULTS <i class="fas fa-plus"></i>
        </div>
        <div id="children">
          CHILDREN <i class="fas fa-plus"></i>
        </div>
        <div id="submit">
          CHECK AVAILABILITY <!-- <i class="fas fa-check"></i>  -->
        </div>
      </div>
      <div id=date-picker>
        <!-- calendar -->
        <div id='app'>
<!--         <v-calendar></v-calendar> -->
        <v-date-picker v-model="range" is-range />
    </div>
      </div>
    </form>
  </div>
  <!-- 1. Link Vue Javascript -->
    <script src='https://unpkg.com/vue/dist/vue.js'></script>

    <!-- 2. Link VCalendar Javascript (Plugin automatically installed) -->
    <script src='https://unpkg.com/v-calendar'></script>

    <!--3. Create the Vue instance-->
    <script>
      new Vue({
        el: '#app',
        data() {
        	  return {
        	    range: {
        	      start: new Date(),
        	      end: new Date()	
        	    }
        	  }
        	}
      })
    </script>
</body>
</html>