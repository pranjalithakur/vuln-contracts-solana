use anchor_lang::prelude::*;

declare_id!("GNAx7Bnrdd8xVkd4ZzHeCeQutpAA39yreNAghryf4WqK");

#[program]
pub mod test_solana {
    use super::*;

     /// Initializes the admin state, setting it to the authority's public key.
    pub fn initialize(ctx: Context<Initialize>) -> Result<()> {
        let admin_state = &mut ctx.accounts.admin_account;
        admin_state.admin = *ctx.accounts.authority.key;
        msg!("Initialized admin: {:?}", ctx.accounts.authority.key);
        Ok(())
    }

    /// **Vulnerable Function**: Updates the admin without checking if `authority` is a signer.
    pub fn update_admin(ctx: Context<UpdateAdmin>) -> Result<()> {
        let admin_state = &mut ctx.accounts.admin_account;
        // Vulnerable: No check on whether `authority` is the actual signer.
        admin_state.admin = *ctx.accounts.new_admin.key;
        msg!("Admin updated to: {:?}", ctx.accounts.new_admin.key);
        Ok(())
    }
}

#[account]
#[derive(Default, Debug)]
pub struct AdminState {
    pub admin: Pubkey,
}

#[derive(Accounts)]
pub struct Initialize<'info> {
    /// The account to store admin state. Allocates 8 bytes for the discriminator + 32 bytes for the Pubkey.
    #[account(init, payer = authority, space = 8 + 32 + 8)]
    pub admin_account: Account<'info, AdminState>,
    /// The authority that pays and is set as the initial admin.
    #[account(mut)]
    pub authority: Signer<'info>,
    pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
pub struct UpdateAdmin<'info> {
    /// The mutable admin state account.
    #[account(mut)]
    pub admin_account: Account<'info, AdminState>,
    /// CHECK: This account is intentionally unchecked for signature to simulate a missing signer vulnerability.
    pub authority: AccountInfo<'info>,
    /// CHECK: This account is intentionally unchecked for signature to simulate a missing signer vulnerability.
    pub new_admin: AccountInfo<'info>,
}
