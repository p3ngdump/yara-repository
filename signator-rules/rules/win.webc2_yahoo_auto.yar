rule win_webc2_yahoo_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.webc2_yahoo."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.webc2_yahoo"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 83f820 7e0c 53 e8???????? 59 }
            // n = 5, score = 100
            //   83f820               | cmp                 eax, 0x20
            //   7e0c                 | jle                 0xe
            //   53                   | push                ebx
            //   e8????????           |                     
            //   59                   | pop                 ecx

        $sequence_1 = { beff090000 57 8bce 33c0 8dbdf587ffff 8895f487ffff f3ab }
            // n = 7, score = 100
            //   beff090000           | mov                 esi, 0x9ff
            //   57                   | push                edi
            //   8bce                 | mov                 ecx, esi
            //   33c0                 | xor                 eax, eax
            //   8dbdf587ffff         | lea                 edi, [ebp - 0x780b]
            //   8895f487ffff         | mov                 byte ptr [ebp - 0x780c], dl
            //   f3ab                 | rep stosd           dword ptr es:[edi], eax

        $sequence_2 = { 56 6a00 50 e8???????? 83c41c 8d85f4afffff }
            // n = 6, score = 100
            //   56                   | push                esi
            //   6a00                 | push                0
            //   50                   | push                eax
            //   e8????????           |                     
            //   83c41c               | add                 esp, 0x1c
            //   8d85f4afffff         | lea                 eax, [ebp - 0x500c]

        $sequence_3 = { 59 53 ff15???????? 85c0 7442 }
            // n = 5, score = 100
            //   59                   | pop                 ecx
            //   53                   | push                ebx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7442                 | je                  0x44

        $sequence_4 = { 56 ff750c ff15???????? 57 e8???????? 8b450c 83c414 }
            // n = 7, score = 100
            //   56                   | push                esi
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff15????????         |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   83c414               | add                 esp, 0x14

        $sequence_5 = { ff15???????? 57 898698841e00 e8???????? }
            // n = 4, score = 100
            //   ff15????????         |                     
            //   57                   | push                edi
            //   898698841e00         | mov                 dword ptr [esi + 0x1e8498], eax
            //   e8????????           |                     

        $sequence_6 = { 8b35???????? bf00010000 57 8d85fcfeffff }
            // n = 4, score = 100
            //   8b35????????         |                     
            //   bf00010000           | mov                 edi, 0x100
            //   57                   | push                edi
            //   8d85fcfeffff         | lea                 eax, [ebp - 0x104]

        $sequence_7 = { e8???????? 53 c745fc???????? e8???????? }
            // n = 4, score = 100
            //   e8????????           |                     
            //   53                   | push                ebx
            //   c745fc????????       |                     
            //   e8????????           |                     

        $sequence_8 = { 58 888614e75e00 48 46 83f830 7df3 }
            // n = 6, score = 100
            //   58                   | pop                 eax
            //   888614e75e00         | mov                 byte ptr [esi + 0x5ee714], al
            //   48                   | dec                 eax
            //   46                   | inc                 esi
            //   83f830               | cmp                 eax, 0x30
            //   7df3                 | jge                 0xfffffff5

        $sequence_9 = { c7459c44000000 897dfc 0f84d7010000 48 0f841b010000 48 }
            // n = 6, score = 100
            //   c7459c44000000       | mov                 dword ptr [ebp - 0x64], 0x44
            //   897dfc               | mov                 dword ptr [ebp - 4], edi
            //   0f84d7010000         | je                  0x1dd
            //   48                   | dec                 eax
            //   0f841b010000         | je                  0x121
            //   48                   | dec                 eax

    condition:
        7 of them and filesize < 8060928
}