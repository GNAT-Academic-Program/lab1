with Ada.Real_Time; use Ada.Real_Time;
with STM32.Board; use STM32.Board;
with STM32.GPIO; use STM32.GPIO;
with STM32.Device; use STM32.Device;
with Phase_1; use phase_1;
with Phase_2; use phase_2;
with Phase_3; use phase_3;
with Phase_4; use phase_4;
with Phase_5; use phase_5;
with LEDs; use LEDs;
procedure Lab1 is

   LEDs : GPIO_Points := R_LED & Y_LED & G_LED & R_LED_P & G_LED_P;

   procedure Configure_Button is
   begin
      STM32.Board.Configure_User_Button_GPIO;
   end Configure_Button;

   Button_Pressed : Boolean := False;

   Period       : constant Time_Span := Milliseconds (1_000);
   Next_Release : Time               := Clock;

   procedure Initi_LEDs is
   begin
      Enable_Clock (LEDs);

      Configure_IO
        (LEDs,
         (Mode => Mode_Out, Output_Type => Push_Pull, Speed => Speed_100MHz,
          Resistors => Floating));
   end Initi_LEDs;

begin
   Initi_LEDs;
   Configure_Button;
   loop
      Button_Pressed := STM32.GPIO.Set(STM32.Board.User_Button_Point);
      if Button_Pressed then
         Phase_2.Execute;
         Phase_3.Execute;
         Phase_4.Execute;
         Phase_3.Execute;
         Phase_5.Execute;
      else
         Phase_1.Execute;
      end if;
      Phase_1.Execute;
   end loop;
end Lab1;
