with STM32.Board; use STM32.Board;
with STM32.GPIO; use STM32.GPIO;
with STM32.Device; use STM32.Device;
with LED; use LED;

procedure Part2 is

   LEDs : GPIO_Points := R_LED & Y_LED & G_LED & R_LED_P & G_LED_P;

   procedure Init_LEDs is
   begin
      Enable_Clock (LEDs);

      Configure_IO
        (LEDs,
         (Mode => Mode_Out, Output_Type => Push_Pull, Speed => Speed_100MHz,
          Resistors => Floating));
   end Init_LEDs;

   procedure Init_Button is
   begin
      STM32.Board.Configure_User_Button_GPIO;
   end Init_Button;

   function Is_Button_Pressed return Boolean is
      (STM32.GPIO.Set(STM32.Board.User_Button_Point));

   procedure motorist_phase(R: Boolean; Y: Boolean; G: Boolean) is
   begin
      if R then On(R_LED); else Off(R_LED); end if;
      if Y then On(Y_LED); else Off(Y_LED); end if;
      if G then On(G_LED); else Off(G_LED); end if;

   end motorist_phase;

   procedure pedestrian_walk is
   begin
      Off(R_LED_P);
      On(G_LED_P);

   end pedestrian_walk;

   procedure pedestrian_stop is
   begin
      On(R_LED_P);
      Off(G_LED_P);

   end pedestrian_stop;

   procedure Phase_1 is
   begin
      motorist_phase(False, False, True);
      pedestrian_stop;
   end Phase_1;

   procedure Phase_2 is
   begin
      motorist_phase(False, True, False);
      pedestrian_stop;

      delay 3.0;
   end Phase_2;

   procedure Phase_3 is
   begin
      motorist_phase(True, False, False);
      pedestrian_stop;

      delay 1.0;
   end Phase_3;

   procedure Phase_4 is
   begin
      motorist_phase(True, False, False);
      pedestrian_walk;

      delay 10.0;
   end Phase_4;

   procedure Phase_5 is
   begin
      Phase_3;
   end Phase_5;

   procedure Phase_6 is
   begin
      motorist_phase(True, True, False);
      pedestrian_stop;

      delay 2.0;
   end Phase_6;

begin
   Init_LEDs;
   Init_Button;
   loop
      if Is_Button_Pressed then
         Phase_2;
         Phase_3;
         Phase_4;
         Phase_5;
         Phase_6;
      else
         Phase_1;
      end if;
      delay 0.01;
   end loop;
end Part2;
