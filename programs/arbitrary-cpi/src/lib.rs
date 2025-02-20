use anchor_lang::prelude::*;
use anchor_lang::solana_program::instruction::Instruction;
use anchor_lang::solana_program::program::invoke;

declare_id!("GNAx7Bnrdd8xVkd4ZzHeCeQutpAA39yreNAghryf4WqK");

#[program]
pub mod arbitrary_cpi {
    use super::*;

    pub fn update_admin(ctx: Context<UpdateAdmin>, new_admin: Pubkey) -> Result<()> {
        // Update the admin state.
        ctx.accounts.admin_state.admin = new_admin;

        // Vulnerable: Perform an arbitrary CPI call using the provided program.
        let cpi_program = ctx.accounts.cpi_program.clone();
        let ix = Instruction {
            program_id: cpi_program.key(),
            accounts: vec![], // No specific accounts are passed.
            data: vec![1, 2, 3], // Dummy instruction data.
        };

        // No check is performed on `cpi_program`; it could be any program.
        invoke(&ix, &[ctx.accounts.cpi_program.clone()])?;

        Ok(())
    }

}

#[derive(Accounts)]
pub struct UpdateAdmin<'info> {
    #[account(mut)]
    pub admin_state: Account<'info, AdminState>,
    pub authority: Signer<'info>,
    /// CHECK: This account is used as the target for a CPI call.
    pub cpi_program: AccountInfo<'info>,
}

#[account]
#[derive(Default)]
pub struct AdminState {
    pub admin: Pubkey,
}
