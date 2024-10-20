use_bpm 80  # Tempo tranquilo y relajado

# Piano dulce con acordes
live_loop :piano_base do
  use_synth :piano
  with_fx :reverb, room: 0.7, mix: 0.5 do
    play_chord [:C4, :E4, :G4], sustain: 8, release: 2  # Acorde principal
    sleep 8
    play_chord [:A3, :C4, :E4], sustain: 8, release: 2  # Cambio de acorde
    sleep 8
  end
end

# Añadimos un piano suave para el bajo
live_loop :piano_bass, sync: :piano_base do
  use_synth :piano
  with_fx :reverb, room: 0.8, mix: 0.5 do
    play :C3, sustain: 8, release: 2  # Nota grave
    sleep 8
    play :A2, sustain: 8, release: 2  # Nota grave
    sleep 8
  end
end

# Brillos (arpegios suaves)
live_loop :brillos, sync: :piano_base do
  use_synth :pretty_bell  # Sonido brillante, delicado
  with_fx :reverb, room: 1, mix: 0.7 do
    play_pattern_timed [:C5, :E5, :G5, :C6], [0.5, 0.5, 0.5, 2], release: 1
    sleep 4
    play_pattern_timed [:A4, :C5, :E5, :A5], [0.5, 0.5, 0.5, 2], release: 1
    sleep 4
  end
end

# Violín (simulación usando saw y efectos)
live_loop :violin, sync: :piano_base do
  use_synth :saw  # El sintetizador tipo sierra tiene un sonido "de cuerdas"
  with_fx :reverb, room: 0.9, mix: 0.6 do
    with_fx :slicer, phase: 0.25, wave: 1, probability: 0.7 do
      play :G4, sustain: 8, attack: 2, release: 4  # Nota de violín, sostenida
      sleep 8
      play :E4, sustain: 8, attack: 2, release: 4  # Cambio de nota
      sleep 8
    end
  end
end
