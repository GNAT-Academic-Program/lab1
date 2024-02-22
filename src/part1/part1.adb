with STM32.Board; use STM32.Board;
with STM32.GPIO; use STM32.GPIO;
with STM32.Device; use STM32.Device;
with LED; use LED;

procedure part1 is

   LEDs : GPIO_Points := R_LED & Y_LED & G_LED;

   procedure Init_LEDs is
   begin
      Enable_Clock (LEDs);

      Configure_IO
        (LEDs,
        (Mode => Mode_Out, Output_Type => Push_Pull, Speed => Speed_100MHz,
          Resistors => Floating));
   end Init_LEDs;

   procedure Phase_1 is
   begin
      On (R_LED); 
      Off (Y_LED);  
      Off (G_LED);  
      delay 10.0;
   end Phase_1;

   procedure Phase_2 is
   begin
      On (R_LED); 
      On (Y_LED); 
      Off (G_LED);  

      delay 2.0;
   end Phase_2;

   procedure Phase_3 is
   begin
      Off (R_LED);  
      Off (Y_LED);  
      On (G_LED); 

      delay 10.0;
   end Phase_3;

   procedure Phase_4 is
   begin
      Off (R_LED);  
      On (Y_LED); 
      Off (G_LED); 

      delay 3.0;
   end Phase_4;

begin
   Init_LEDs;
   loop
      Phase_1;
      Phase_2;
      Phase_3;
      Phase_4;
   end loop;
end part1;
