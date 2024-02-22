with STM32.Board; use STM32.Board;
with STM32.GPIO; use STM32.GPIO;
with STM32.Device; use STM32.Device;
with LEDs; use LEDs;

package body Phase_1 is
   procedure Execute is
   begin
      Turn_Off (R_LED);
      Turn_On (Y_LED);
      Turn_On (G_LED);
      delay 1.0;
   end Execute;
end Phase_1;
