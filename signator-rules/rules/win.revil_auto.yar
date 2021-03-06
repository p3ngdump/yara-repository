rule win_revil_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.revil."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.revil"
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
        $sequence_0 = { c1ee17 0bc7 0bce 8b7508 898ebc000000 8bcb }
            // n = 6, score = 4600
            //   c1ee17               | shr                 esi, 0x17
            //   0bc7                 | or                  eax, edi
            //   0bce                 | or                  ecx, esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   898ebc000000         | mov                 dword ptr [esi + 0xbc], ecx
            //   8bcb                 | mov                 ecx, ebx

        $sequence_1 = { 8975d8 0fb6450b 0bc8 8b45b4 }
            // n = 4, score = 4600
            //   8975d8               | mov                 dword ptr [ebp - 0x28], esi
            //   0fb6450b             | movzx               eax, byte ptr [ebp + 0xb]
            //   0bc8                 | or                  ecx, eax
            //   8b45b4               | mov                 eax, dword ptr [ebp - 0x4c]

        $sequence_2 = { 8dbd80feffff f3a5 50 e8???????? }
            // n = 4, score = 4600
            //   8dbd80feffff         | lea                 edi, [ebp - 0x180]
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   50                   | push                eax
            //   e8????????           |                     

        $sequence_3 = { 50 e8???????? 8d8538ffffff 50 8d4590 50 }
            // n = 6, score = 4600
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d8538ffffff         | lea                 eax, [ebp - 0xc8]
            //   50                   | push                eax
            //   8d4590               | lea                 eax, [ebp - 0x70]
            //   50                   | push                eax

        $sequence_4 = { 6a14 59 ff751c 8dbd80feffff }
            // n = 4, score = 4600
            //   6a14                 | push                0x14
            //   59                   | pop                 ecx
            //   ff751c               | push                dword ptr [ebp + 0x1c]
            //   8dbd80feffff         | lea                 edi, [ebp - 0x180]

        $sequence_5 = { f3a5 50 e8???????? 8d8580feffff 50 8d8568ffffff }
            // n = 6, score = 4600
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   50                   | push                eax
            //   e8????????           |                     
            //   8d8580feffff         | lea                 eax, [ebp - 0x180]
            //   50                   | push                eax
            //   8d8568ffffff         | lea                 eax, [ebp - 0x98]

        $sequence_6 = { 0facf709 c1e117 c1ee09 0bc7 0bce }
            // n = 5, score = 4600
            //   0facf709             | shrd                edi, esi, 9
            //   c1e117               | shl                 ecx, 0x17
            //   c1ee09               | shr                 esi, 9
            //   0bc7                 | or                  eax, edi
            //   0bce                 | or                  ecx, esi

        $sequence_7 = { 8d8510ffffff 50 8d8560ffffff 50 8d45b0 50 }
            // n = 6, score = 4600
            //   8d8510ffffff         | lea                 eax, [ebp - 0xf0]
            //   50                   | push                eax
            //   8d8560ffffff         | lea                 eax, [ebp - 0xa0]
            //   50                   | push                eax
            //   8d45b0               | lea                 eax, [ebp - 0x50]
            //   50                   | push                eax

        $sequence_8 = { 81ecf0040000 53 56 57 bf90000000 }
            // n = 5, score = 4600
            //   81ecf0040000         | sub                 esp, 0x4f0
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   bf90000000           | mov                 edi, 0x90

        $sequence_9 = { 0f84a9060000 83e813 0f85cc060000 e9???????? ff45bc 8365c000 }
            // n = 6, score = 4600
            //   0f84a9060000         | je                  0x6af
            //   83e813               | sub                 eax, 0x13
            //   0f85cc060000         | jne                 0x6d2
            //   e9????????           |                     
            //   ff45bc               | inc                 dword ptr [ebp - 0x44]
            //   8365c000             | and                 dword ptr [ebp - 0x40], 0

    condition:
        7 of them and filesize < 155794432
}