# ---------------------------------------------| source |--------------------------------------------- #

set(source_extension            )
set(source_common               )
set(source_target               )
set(source_host                 )

# ---------------------------------------------| definition |--------------------------------------------- #

set(public_definition_common    )
set(public_definition_target    )
set(public_definition_host      )

set(private_definition_common   )
set(private_definition_target   )
set(private_definition_host     )

# ---------------------------------------------| option |--------------------------------------------- #

set(public_option_common        )
set(public_option_target        )
set(public_option_host          )

set(private_option_common       )
set(private_option_target       )
set(private_option_host         )

# ---------------------------------------------| include |--------------------------------------------- #

set(public_include_common       )
set(public_include_target       )
set(public_include_host         )

set(private_include_common      )
set(private_include_target      )
set(private_include_host        )

# ---------------------------------------------| link |--------------------------------------------- #

set(public_link_common          )
set(public_link_target          --specs=nosys.specs -nostartfiles

                                -T ${CMAKE_CURRENT_SOURCE_DIR}/linker/script_${memory_cached}.ld 
                                -Wl,--defsym=__sdram_start=${sdram_start_cached}
                                -Wl,--defsym=__sdram_size=${sdram_size_cached}
                                -Wl,--defsym=__sdram_size_stack=${sdram_size_stack_cached}
                                -Wl,--defsym=__sdram_size_pool=${sdram_size_pool_cached}
                                -Wl,--defsym=__ocram_start=${ocram_start_cached}
                                -Wl,--defsym=__ocram_size=${ocram_size_cached}
                                -Wl,--defsym=__ocram_size_stack=${ocram_size_stack_cached}
                                -Wl,--defsym=__ocram_size_pool=${ocram_size_pool_cached}
                                -Wl,--entry=__vector_start)
set(public_link_host            )

set(private_link_common         )
set(private_link_target         )
set(private_link_host           )
