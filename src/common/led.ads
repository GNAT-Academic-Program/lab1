with STM32.Board; use STM32.Board;
with STM32.Device; use STM32.Device;
with STM32.GPIO;

package LED is
   R_LED : User_LED renames PG9;
   Y_LED : User_LED renames PG10;
   G_LED : User_LED renames PG11;
   R_LED_P : User_LED renames PG6;
   G_LED_P : User_LED renames PG7;

   procedure On  (This : in out User_LED) renames STM32.GPIO.Clear;
   procedure Off (This : in out User_LED) renames STM32.GPIO.Set;
end LED;
