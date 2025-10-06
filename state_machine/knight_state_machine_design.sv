
typedef enum logic [2:0]
{
  S0 = 3'b000,
  S1 = 3'b001,
  S2 = 3'b010,
  S3 = 3'b011,
  S4 = 3'b100
} state_t;
module knight_life(
  // Inputs using logic type
  input logic adventure,
  input logic courage,
  input logic sword_sharpened,
  input logic dragon,
  input logic clock,
  // Output using logic type
  output logic quest_over
);
state_t present_state, next_state; // Use the defined enum type
// Lógica combinacional para el próximo estado
	always_comb
		begin
// Valor por defecto
			next_state = present_state;
            case(present_state)
              S0: if (adventure)
              next_state = S1;
              S1: if (sword_sharpened)
              next_state = S2;
              S2: if (courage)
              next_state = state_t'(dragon ? S3 : S2);
              else
              next_state = S0;
              S3: if (dragon) next_state = S2;
              else next_state = S4;
              S4: next_state = S4;
              default: next_state = S0;
			endcase
		end
// Lógica combinacional para la salida
	always_comb
		begin
			quest_over = (present_state == S4);
		end
// Elemento secuencial (no se puede cambiar a always_comb)
	always_ff @(posedge clock)
	begin
// Usar asignación no bloqueante
		present_state <= next_state;
	end
endmodule
